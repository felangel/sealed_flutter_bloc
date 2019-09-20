import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc6.dart';

void main() {
  group('SealedBlocBuilder6', () {
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder6<HelperBloc6, HelperState6, State1, State2, State3,
              State4, State5, State6>(
            bloc: HelperBloc6(),
            builder: null,
          ),
        );
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc6();
      await tester.pumpWidget(
        SealedBlocBuilder6<HelperBloc6, HelperState6, State1, State2, State3,
            State4, State5, State6>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (State1 first) => Container(key: Key('__target1__')),
              (State2 second) => Container(key: Key('__target2__')),
              (State3 third) => Container(key: Key('__target3__')),
              (State4 fourth) => Container(key: Key('__target4__')),
              (State5 fifth) => Container(key: Key('__target5__')),
              (State6 sixth) => Container(key: Key('__target6__')),
            );
          },
        ),
      );
      expect(find.byKey(Key('__target1__')), findsOneWidget);

      bloc.dispatch(HelperEvent6.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target2__')), findsOneWidget);

      bloc.dispatch(HelperEvent6.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target3__')), findsOneWidget);

      bloc.dispatch(HelperEvent6.event4);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target4__')), findsOneWidget);

      bloc.dispatch(HelperEvent6.event5);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target5__')), findsOneWidget);

      bloc.dispatch(HelperEvent6.event6);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target6__')), findsOneWidget);
    });
  });
}
