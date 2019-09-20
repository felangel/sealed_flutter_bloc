import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent4 { event2, event3, event4 }

class HelperState4 extends Union4Impl<State1, State2, State3, State4> {
  static final unions = const Quartet<State1, State2, State3, State4>();

  HelperState4._(Union4<State1, State2, State3, State4> union) : super(union);

  factory HelperState4.first() => HelperState4._(unions.first(State1()));

  factory HelperState4.second() => HelperState4._(unions.second(State2()));

  factory HelperState4.third() => HelperState4._(unions.third(State3()));

  factory HelperState4.fourth() => HelperState4._(unions.fourth(State4()));
}

class State1 {}

class State2 {}

class State3 {}

class State4 {}

class HelperBloc4 extends Bloc<HelperEvent4, HelperState4> {
  @override
  HelperState4 get initialState => HelperState4.first();

  @override
  Stream<HelperState4> mapEventToState(
    HelperEvent4 event,
  ) async* {
    switch (event) {
      case HelperEvent4.event2:
        yield HelperState4.second();
        break;
      case HelperEvent4.event3:
        yield HelperState4.third();
        break;
      case HelperEvent4.event4:
        yield HelperState4.fourth();
        break;
    }
  }
}
