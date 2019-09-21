import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'package:flutter_infinite_list/repositories/repositories.dart';
import 'package:flutter_infinite_list/bloc/bloc.dart';
import 'package:flutter_infinite_list/models/models.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      builder: (context) => PostRepository(
        httpClient: http.Client(),
      ),
      child: MaterialApp(
        title: 'Flutter Infinite Scroll',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Posts'),
          ),
          body: BlocProvider(
            builder: (context) => PostBloc(
              postRepository: RepositoryProvider.of<PostRepository>(context),
            )..dispatch(PostEvent.fetch()),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SealedBlocBuilder3<PostBloc, PostState, Initial, Success, Failure>(
      builder: (context, states) {
        return states(
          (Initial initial) => Center(child: CircularProgressIndicator()),
          (Success success) => PostList(
            posts: success.posts,
            hasReachedMax: success.hasReachedMax,
          ),
          (Failure failure) => Center(
            child: Text('failed to fetch posts'),
          ),
        );
      },
    );
  }
}

class PostList extends StatefulWidget {
  final List<Post> posts;
  final bool hasReachedMax;

  PostList({
    Key key,
    @required this.posts,
    @required this.hasReachedMax,
  }) : super(key: key);

  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> get posts => widget.posts;
  bool get hasReachedMax => widget.hasReachedMax;

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return Center(
        child: Text('no posts'),
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index >= posts.length
            ? BottomLoader()
            : PostWidget(post: posts[index]);
      },
      itemCount: hasReachedMax ? posts.length : posts.length + 1,
      controller: _scrollController,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.dispatch(PostEvent.fetch());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${post.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}
