import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent5 { event2, event3, event4, event5 }

class HelperState5 extends Union5Impl<State1, State2, State3, State4, State5> {
  HelperState5._(Union5<State1, State2, State3, State4, State5> union)
      : super(union);

  factory HelperState5.first() => HelperState5._(unions.first(State1()));

  factory HelperState5.second() => HelperState5._(unions.second(State2()));

  factory HelperState5.third() => HelperState5._(unions.third(State3()));

  factory HelperState5.fourth() => HelperState5._(unions.fourth(State4()));

  factory HelperState5.fifth() => HelperState5._(unions.fifth(State5()));

  static final Quintet<State1, State2, State3, State4, State5> unions =
      const Quintet<State1, State2, State3, State4, State5>();
}

class State1 {}

class State2 {}

class State3 {}

class State4 {}

class State5 {}

class HelperBloc5 extends Bloc<HelperEvent5, HelperState5> {
  HelperBloc5() : super(HelperState5.first()) {
    on<HelperEvent5>((event, emit) {
      switch (event) {
        case HelperEvent5.event2:
          return emit(HelperState5.second());
        case HelperEvent5.event3:
          return emit(HelperState5.third());
        case HelperEvent5.event4:
          return emit(HelperState5.fourth());
        case HelperEvent5.event5:
          return emit(HelperState5.fifth());
      }
    });
  }
}
