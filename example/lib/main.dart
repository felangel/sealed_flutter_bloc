import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

void main() => runApp(MyApp());

class MyState extends Union4Impl<Initial, Loading, Success, Failure> {
  static final unions = const Quartet<Initial, Loading, Success, Failure>();

  MyState._(Union4<Initial, Loading, Success, Failure> union) : super(union);

  factory MyState.initial() => MyState._(unions.first(Initial()));

  factory MyState.loading() => MyState._(unions.second(Loading()));

  factory MyState.success({String data}) =>
      MyState._(unions.third(Success(data: data)));

  factory MyState.failure({String error}) =>
      MyState._(unions.fourth(Failure(error: error)));
}

class Initial {}

class Loading {}

class Success {
  final String data;

  Success({this.data});
}

class Failure {
  String error;

  Failure({this.error});
}

enum MyEvent { load, error }

class MyBloc extends Bloc<MyEvent, MyState> {
  @override
  MyState get initialState => MyState.initial();

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    switch (event) {
      case MyEvent.load:
        yield MyState.loading();
        await Future<void>.delayed(Duration(seconds: 3));
        yield MyState.success(data: 'Some Data');
        break;
      case MyEvent.error:
        yield MyState.failure(error: 'oops!');
        break;
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<MyBloc>(
        builder: (context) => MyBloc(),
        child: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: SealedBlocBuilder4<MyBloc, MyState, Initial, Loading, Success,
            Failure>(
          builder: (context, states) => states(
            (initial) => Text('Initial'),
            (loading) => CircularProgressIndicator(),
            (success) => Text('Success: ${success.data}'),
            (failure) => Text('Failure: ${failure.error}'),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: () {
                BlocProvider.of<MyBloc>(context).add(MyEvent.load);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: Icon(Icons.error),
              onPressed: () {
                BlocProvider.of<MyBloc>(context).add(MyEvent.error);
              },
            ),
          ),
        ],
      ),
    );
  }
}
