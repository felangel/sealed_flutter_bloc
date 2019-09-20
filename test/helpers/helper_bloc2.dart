import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent2 { event2 }

class HelperState2 extends Union2Impl<State1, State2> {
  static final unions = const Doublet<State1, State2>();

  HelperState2._(Union2<State1, State2> union) : super(union);

  factory HelperState2.first() => HelperState2._(unions.first(State1()));

  factory HelperState2.second() => HelperState2._(unions.second(State2()));
}

class State1 {}

class State2 {}

class HelperBloc2 extends Bloc<HelperEvent2, HelperState2> {
  @override
  HelperState2 get initialState => HelperState2.first();

  @override
  Stream<HelperState2> mapEventToState(
    HelperEvent2 event,
  ) async* {
    switch (event) {
      case HelperEvent2.event2:
        yield HelperState2.second();
        break;
    }
  }
}
