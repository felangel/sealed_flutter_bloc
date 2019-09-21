import 'dart:async';

import 'package:flutter_infinite_list/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_infinite_list/bloc/bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc({@required PostRepository postRepository})
      : _postRepository = postRepository;

  @override
  Stream<PostState> transformEvents(
    Stream<PostEvent> events,
    Stream<PostState> Function(PostEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<PostEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => PostState.initial();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    yield* event.join<Stream<PostState>>(
      (Fetch fetch) async* {
        yield* currentState.join<Stream<PostState>>(
          (Initial initial) => _mapInitialAndFetchToState(initial, fetch),
          (Success success) => _mapSuccessAndFetchToState(success, fetch),
          (Failure failure) => _mapFailureAndFetchToState(failure, fetch),
        );
      },
    );
  }

  Stream<PostState> _mapInitialAndFetchToState(
    Initial initial,
    Fetch fetch,
  ) async* {
    final posts = await _postRepository.getPosts(0, 20);
    yield PostState.success(posts: posts, hasReachedMax: false);
  }

  Stream<PostState> _mapSuccessAndFetchToState(
    Success success,
    Fetch fetch,
  ) async* {
    if (!success.hasReachedMax) {
      final posts = await _postRepository.getPosts(success.posts.length, 20);
      yield posts.isEmpty
          ? PostState.success(posts: success.posts, hasReachedMax: true)
          : PostState.success(
              posts: success.posts + posts,
              hasReachedMax: false,
            );
    }
  }

  Stream<PostState> _mapFailureAndFetchToState(
    Failure failure,
    Fetch fetch,
  ) async* {
    final posts = await _postRepository.getPosts(0, 20);
    yield PostState.success(posts: posts, hasReachedMax: false);
  }
}
