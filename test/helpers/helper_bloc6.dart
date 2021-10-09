import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent6 { event2, event3, event4, event5, event6 }

class HelperState6
    extends Union6Impl<State1, State2, State3, State4, State5, State6> {
  HelperState6._(Union6<State1, State2, State3, State4, State5, State6> union)
      : super(union);

  factory HelperState6.first() => HelperState6._(unions.first(State1()));

  factory HelperState6.second() => HelperState6._(unions.second(State2()));

  factory HelperState6.third() => HelperState6._(unions.third(State3()));

  factory HelperState6.fourth() => HelperState6._(unions.fourth(State4()));

  factory HelperState6.fifth() => HelperState6._(unions.fifth(State5()));

  factory HelperState6.sixth() => HelperState6._(unions.sixth(State6()));

  static final Sextet<State1, State2, State3, State4, State5, State6> unions =
      const Sextet<State1, State2, State3, State4, State5, State6>();
}

class State1 {}

class State2 {}

class State3 {}

class State4 {}

class State5 {}

class State6 {}

class HelperBloc6 extends Bloc<HelperEvent6, HelperState6> {
  HelperBloc6() : super(HelperState6.first()) {
    on<HelperEvent6>((event, emit) {
      switch (event) {
        case HelperEvent6.event2:
          return emit(HelperState6.second());
        case HelperEvent6.event3:
          return emit(HelperState6.third());
        case HelperEvent6.event4:
          return emit(HelperState6.fourth());
        case HelperEvent6.event5:
          return emit(HelperState6.fifth());
        case HelperEvent6.event6:
          return emit(HelperState6.sixth());
      }
    });
  }
}
