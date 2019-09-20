import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent1 { event1 }

class HelperState1 extends Union0Impl<State1> {
  static final unions = const Nullet<State1>();

  HelperState1._(Union0<State1> union) : super(union);

  factory HelperState1.first() => HelperState1._(unions.first(State1()));
}

class State1 {}

class HelperBloc1 extends Bloc<HelperEvent1, HelperState1> {
  @override
  HelperState1 get initialState => HelperState1.first();

  @override
  Stream<HelperState1> mapEventToState(
    HelperEvent1 event,
  ) async* {}
}
