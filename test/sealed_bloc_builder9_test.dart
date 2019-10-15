import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc9.dart';

void main() {
  group('SealedBlocBuilder9', () {
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder9<HelperBloc9, HelperState9, State1, State2, State3,
              State4, State5, State6, State7, State8, State9>(
            bloc: HelperBloc9(),
            builder: null,
          ),
        );
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc9();
      await tester.pumpWidget(
        SealedBlocBuilder9<HelperBloc9, HelperState9, State1, State2, State3,
            State4, State5, State6, State7, State8, State9>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (State1 first) => Container(key: Key('__target1__')),
              (State2 second) => Container(key: Key('__target2__')),
              (State3 third) => Container(key: Key('__target3__')),
              (State4 fourth) => Container(key: Key('__target4__')),
              (State5 fifth) => Container(key: Key('__target5__')),
              (State6 sixth) => Container(key: Key('__target6__')),
              (State7 seventh) => Container(key: Key('__target7__')),
              (State8 eighth) => Container(key: Key('__target8__')),
              (State9 ninth) => Container(key: Key('__target9__')),
            );
          },
        ),
      );
      expect(find.byKey(Key('__target1__')), findsOneWidget);

      bloc.add(HelperEvent9.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target2__')), findsOneWidget);

      bloc.add(HelperEvent9.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target3__')), findsOneWidget);

      bloc.add(HelperEvent9.event4);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target4__')), findsOneWidget);

      bloc.add(HelperEvent9.event5);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target5__')), findsOneWidget);

      bloc.add(HelperEvent9.event6);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target6__')), findsOneWidget);

      bloc.add(HelperEvent9.event7);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target7__')), findsOneWidget);

      bloc.add(HelperEvent9.event8);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target8__')), findsOneWidget);

      bloc.add(HelperEvent9.event9);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target9__')), findsOneWidget);
    });
  });
}
