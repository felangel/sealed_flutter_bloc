import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

void main() => runApp(MyApp());

/// Example of [Union4Impl] which consists of:
/// * [Initial]
/// * [Loading]
/// * [Success]
/// * [Failure]
class MyState extends Union4Impl<Initial, Loading, Success, Failure> {
  MyState._(Union4<Initial, Loading, Success, Failure> union) : super(union);

  /// {@template initial}
  /// Initial state before any events are added.
  /// {@endtemplate}
  factory MyState.initial() => MyState._(unions.first(Initial()));

  /// {@template loading}
  /// State while data is being loaded asynchronously.
  /// {@endtemplate}
  factory MyState.loading() => MyState._(unions.second(Loading()));

  /// {@template success}
  /// State when data has been sucessfully loaded.
  /// {@endtemplate}
  factory MyState.success({required String data}) =>
      MyState._(unions.third(Success(data: data)));

  /// {@template failure}
  /// State when data load has failed.
  /// {@endtemplate}
  factory MyState.failure({required String error}) =>
      MyState._(unions.fourth(Failure(error: error)));

  /// [Quartet] unions.
  static final unions = const Quartet<Initial, Loading, Success, Failure>();
}

/// {@macro initial}
class Initial {}

/// {@macro loading}
class Loading {}

/// {@macro success}
class Success {
  /// {@macro success}
  const Success({required this.data});

  /// THe resulting [data].
  final String data;
}

/// {@macro failure}
class Failure {
  /// {@macro failure}
  const Failure({required this.error});

  /// The error which caused the failure.
  final String error;
}

/// Sample events which bloc can respond to.
abstract class MyEvent {}

/// Load has been requested.
class DataRequested extends MyEvent {}

/// Error has occurred.
class ErrorOccurred extends MyEvent {}

/// {@template my_bloc}
/// Simple Data Fetching Bloc
/// {@endtemplate}
class MyBloc extends Bloc<MyEvent, MyState> {
  /// {@macro my_bloc}
  MyBloc() : super(MyState.initial()) {
    on<DataRequested>((event, emit) async {
      emit(MyState.loading());
      await Future<void>.delayed(const Duration(seconds: 3));
      emit(MyState.success(data: 'Some Data'));
    });

    on<ErrorOccurred>((event, emit) => emit(MyState.failure(error: 'oops!')));
  }
}

/// [StatelessWidget] which provides an instance of [MyBloc] to [MyHome].
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<MyBloc>(
        create: (context) => MyBloc(),
        child: MyHome(),
      ),
    );
  }
}

/// [StatelessWidget] which uses [SealedBlocBuilder4]
/// to ensure each bloc state maps to a widget.
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: SealedBlocBuilder4<MyBloc, MyState, Initial, Loading, Success,
            Failure>(
          builder: (context, states) => states(
            (initial) => const Text('Initial'),
            (loading) => const CircularProgressIndicator(),
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
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: const Icon(Icons.check),
              onPressed: () => context.read<MyBloc>().add(DataRequested()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: const Icon(Icons.error),
              onPressed: () => context.read<MyBloc>().add(ErrorOccurred()),
            ),
          ),
        ],
      ),
    );
  }
}
