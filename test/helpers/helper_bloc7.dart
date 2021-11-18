import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent7 { event2, event3, event4, event5, event6, event7 }

class HelperState7
    extends Union7Impl<State1, State2, State3, State4, State5, State6, State7> {
  HelperState7._(
      Union7<State1, State2, State3, State4, State5, State6, State7> union)
      : super(union);

  factory HelperState7.first() => HelperState7._(unions.first(State1()));

  factory HelperState7.second() => HelperState7._(unions.second(State2()));

  factory HelperState7.third() => HelperState7._(unions.third(State3()));

  factory HelperState7.fourth() => HelperState7._(unions.fourth(State4()));

  factory HelperState7.fifth() => HelperState7._(unions.fifth(State5()));

  factory HelperState7.sixth() => HelperState7._(unions.sixth(State6()));

  factory HelperState7.seventh() => HelperState7._(unions.seventh(State7()));

  static final Septet<State1, State2, State3, State4, State5, State6, State7>
      unions =
      const Septet<State1, State2, State3, State4, State5, State6, State7>();
}

class State1 {}

class State2 {}

class State3 {}

class State4 {}

class State5 {}

class State6 {}

class State7 {}

class HelperBloc7 extends Bloc<HelperEvent7, HelperState7> {
  HelperBloc7() : super(HelperState7.first()) {
    on<HelperEvent7>((event, emit) {
      switch (event) {
        case HelperEvent7.event2:
          return emit(HelperState7.second());
        case HelperEvent7.event3:
          return emit(HelperState7.third());
        case HelperEvent7.event4:
          return emit(HelperState7.fourth());
        case HelperEvent7.event5:
          return emit(HelperState7.fifth());
        case HelperEvent7.event6:
          return emit(HelperState7.sixth());
        case HelperEvent7.event7:
          return emit(HelperState7.seventh());
      }
    });
  }
}
