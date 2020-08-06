import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc7.dart';

void main() {
  group('SealedBlocBuilder7', () {
    const targetKey1 = Key('__target1__');
    const targetKey2 = Key('__target2__');
    const targetKey3 = Key('__target3__');
    const targetKey4 = Key('__target4__');
    const targetKey5 = Key('__target5__');
    const targetKey6 = Key('__target6__');
    const targetKey7 = Key('__target7__');
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder7<HelperBloc7, HelperState7, State1, State2, State3,
              State4, State5, State6, State7>(
            cubit: HelperBloc7(),
            builder: null,
          ),
        );
      } on Object catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc7();
      await tester.pumpWidget(
        SealedBlocBuilder7<HelperBloc7, HelperState7, State1, State2, State3,
            State4, State5, State6, State7>(
          cubit: bloc,
          builder: (context, states) {
            return states(
              (first) => const SizedBox(key: targetKey1),
              (second) => const SizedBox(key: targetKey2),
              (third) => const SizedBox(key: targetKey3),
              (fourth) => const SizedBox(key: targetKey4),
              (fifth) => const SizedBox(key: targetKey5),
              (sixth) => const SizedBox(key: targetKey6),
              (seventh) => const SizedBox(key: targetKey7),
            );
          },
        ),
      );
      expect(find.byKey(targetKey1), findsOneWidget);

      bloc.add(HelperEvent7.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey2), findsOneWidget);

      bloc.add(HelperEvent7.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey3), findsOneWidget);

      bloc.add(HelperEvent7.event4);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey4), findsOneWidget);

      bloc.add(HelperEvent7.event5);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey5), findsOneWidget);

      bloc.add(HelperEvent7.event6);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey6), findsOneWidget);

      bloc.add(HelperEvent7.event7);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey7), findsOneWidget);
    });
  });
}
