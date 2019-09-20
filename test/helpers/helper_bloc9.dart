import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent9 {
  event2,
  event3,
  event4,
  event5,
  event6,
  event7,
  event8,
  event9
}

class HelperState9 extends Union9Impl<State1, State2, State3, State4, State5,
    State6, State7, State8, State9> {
  static final unions = const Nonet<State1, State2, State3, State4, State5,
      State6, State7, State8, State9>();

  HelperState9._(
      Union9<State1, State2, State3, State4, State5, State6, State7, State8,
              State9>
          union)
      : super(union);

  factory HelperState9.first() => HelperState9._(unions.first(State1()));

  factory HelperState9.second() => HelperState9._(unions.second(State2()));

  factory HelperState9.third() => HelperState9._(unions.third(State3()));

  factory HelperState9.fourth() => HelperState9._(unions.fourth(State4()));

  factory HelperState9.fifth() => HelperState9._(unions.fifth(State5()));

  factory HelperState9.sixth() => HelperState9._(unions.sixth(State6()));

  factory HelperState9.seventh() => HelperState9._(unions.seventh(State7()));

  factory HelperState9.eighth() => HelperState9._(unions.eighth(State8()));

  factory HelperState9.ninth() => HelperState9._(unions.ninth(State9()));
}

class State1 {}

class State2 {}

class State3 {}

class State4 {}

class State5 {}

class State6 {}

class State7 {}

class State8 {}

class State9 {}

class HelperBloc9 extends Bloc<HelperEvent9, HelperState9> {
  @override
  HelperState9 get initialState => HelperState9.first();

  @override
  Stream<HelperState9> mapEventToState(
    HelperEvent9 event,
  ) async* {
    switch (event) {
      case HelperEvent9.event2:
        yield HelperState9.second();
        break;
      case HelperEvent9.event3:
        yield HelperState9.third();
        break;
      case HelperEvent9.event4:
        yield HelperState9.fourth();
        break;
      case HelperEvent9.event5:
        yield HelperState9.fifth();
        break;
      case HelperEvent9.event6:
        yield HelperState9.sixth();
        break;
      case HelperEvent9.event7:
        yield HelperState9.seventh();
        break;
      case HelperEvent9.event8:
        yield HelperState9.eighth();
        break;
      case HelperEvent9.event9:
        yield HelperState9.ninth();
        break;
    }
  }
}
