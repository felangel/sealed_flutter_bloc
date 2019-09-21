import 'package:equatable/equatable.dart';

import 'package:flutter_infinite_list/models/models.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

class PostState extends Union3Impl<Initial, Success, Failure> {
  static final unions = const Triplet<Initial, Success, Failure>();

  PostState._(Union3<Initial, Success, Failure> union) : super(union);

  factory PostState.initial() => PostState._(unions.first(Initial()));

  factory PostState.success({List<Post> posts, bool hasReachedMax}) =>
      PostState._(
        unions.second(Success(posts: posts, hasReachedMax: hasReachedMax)),
      );

  factory PostState.failure() => PostState._(unions.third(Failure()));
}

class Initial extends Equatable {}

class Failure extends Equatable {}

class Success extends Equatable {
  final List<Post> posts;
  final bool hasReachedMax;

  Success({
    this.posts,
    this.hasReachedMax,
  }) : super(<Object>[posts, hasReachedMax]);
}
