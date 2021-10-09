import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent8 { event2, event3, event4, event5, event6, event7, event8 }

class HelperState8 extends Union8Impl<State1, State2, State3, State4, State5,
    State6, State7, State8> {
  HelperState8._(
      Union8<State1, State2, State3, State4, State5, State6, State7, State8>
          union)
      : super(union);

  factory HelperState8.first() => HelperState8._(unions.first(State1()));

  factory HelperState8.second() => HelperState8._(unions.second(State2()));

  factory HelperState8.third() => HelperState8._(unions.third(State3()));

  factory HelperState8.fourth() => HelperState8._(unions.fourth(State4()));

  factory HelperState8.fifth() => HelperState8._(unions.fifth(State5()));

  factory HelperState8.sixth() => HelperState8._(unions.sixth(State6()));

  factory HelperState8.seventh() => HelperState8._(unions.seventh(State7()));

  factory HelperState8.eighth() => HelperState8._(unions.eighth(State8()));

  static final Octet<State1, State2, State3, State4, State5, State6, State7,
          State8> unions =
      const Octet<State1, State2, State3, State4, State5, State6, State7,
          State8>();
}

class State1 {}

class State2 {}

class State3 {}

class State4 {}

class State5 {}

class State6 {}

class State7 {}

class State8 {}

class HelperBloc8 extends Bloc<HelperEvent8, HelperState8> {
  HelperBloc8() : super(HelperState8.first()) {
    on<HelperEvent8>((event, emit) {
      switch (event) {
        case HelperEvent8.event2:
          return emit(HelperState8.second());
        case HelperEvent8.event3:
          return emit(HelperState8.third());
        case HelperEvent8.event4:
          return emit(HelperState8.fourth());
        case HelperEvent8.event5:
          return emit(HelperState8.fifth());
        case HelperEvent8.event6:
          return emit(HelperState8.sixth());
        case HelperEvent8.event7:
          return emit(HelperState8.seventh());
        case HelperEvent8.event8:
          return emit(HelperState8.eighth());
      }
    });
  }
}
