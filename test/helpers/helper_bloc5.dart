import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent5 { event2, event3, event4, event5 }

class HelperState5 extends Union5Impl<State1, State2, State3, State4, State5> {
  static final unions = const Quintet<State1, State2, State3, State4, State5>();

  HelperState5._(Union5<State1, State2, State3, State4, State5> union)
      : super(union);

  factory HelperState5.first() => HelperState5._(unions.first(State1()));

  factory HelperState5.second() => HelperState5._(unions.second(State2()));

  factory HelperState5.third() => HelperState5._(unions.third(State3()));

  factory HelperState5.fourth() => HelperState5._(unions.fourth(State4()));

  factory HelperState5.fifth() => HelperState5._(unions.fifth(State5()));
}

class State1 {}

class State2 {}

class State3 {}

class State4 {}

class State5 {}

class HelperBloc5 extends Bloc<HelperEvent5, HelperState5> {
  @override
  HelperState5 get initialState => HelperState5.first();

  @override
  Stream<HelperState5> mapEventToState(
    HelperEvent5 event,
  ) async* {
    switch (event) {
      case HelperEvent5.event2:
        yield HelperState5.second();
        break;
      case HelperEvent5.event3:
        yield HelperState5.third();
        break;
      case HelperEvent5.event4:
        yield HelperState5.fourth();
        break;
      case HelperEvent5.event5:
        yield HelperState5.fifth();
        break;
    }
  }
}
