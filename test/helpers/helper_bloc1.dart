import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent1 { event1 }

class HelperState1 extends Union0Impl<State1> {
  HelperState1._(Union0<State1> union) : super(union);

  factory HelperState1.first() => HelperState1._(unions.first(State1()));

  static final Nullet<State1> unions = const Nullet<State1>();
}

class State1 {}

class HelperBloc1 extends Bloc<HelperEvent1, HelperState1> {
  HelperBloc1() : super(HelperState1.first()) {
    on<HelperEvent1>((event, emit) => emit(HelperState1.first()));
  }
}
