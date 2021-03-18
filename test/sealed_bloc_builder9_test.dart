import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc9.dart';

void main() {
  group('SealedBlocBuilder9', () {
    const targetKey1 = Key('__target1__');
    const targetKey2 = Key('__target2__');
    const targetKey3 = Key('__target3__');
    const targetKey4 = Key('__target4__');
    const targetKey5 = Key('__target5__');
    const targetKey6 = Key('__target6__');
    const targetKey7 = Key('__target7__');
    const targetKey8 = Key('__target8__');
    const targetKey9 = Key('__target9__');

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc9();
      await tester.pumpWidget(
        SealedBlocBuilder9<HelperBloc9, HelperState9, State1, State2, State3,
            State4, State5, State6, State7, State8, State9>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (first) => const SizedBox(key: targetKey1),
              (second) => const SizedBox(key: targetKey2),
              (third) => const SizedBox(key: targetKey3),
              (fourth) => const SizedBox(key: targetKey4),
              (fifth) => const SizedBox(key: targetKey5),
              (sixth) => const SizedBox(key: targetKey6),
              (seventh) => const SizedBox(key: targetKey7),
              (eighth) => const SizedBox(key: targetKey8),
              (ninth) => const SizedBox(key: targetKey9),
            );
          },
        ),
      );
      expect(find.byKey(targetKey1), findsOneWidget);

      bloc.add(HelperEvent9.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey2), findsOneWidget);

      bloc.add(HelperEvent9.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey3), findsOneWidget);

      bloc.add(HelperEvent9.event4);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey4), findsOneWidget);

      bloc.add(HelperEvent9.event5);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey5), findsOneWidget);

      bloc.add(HelperEvent9.event6);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey6), findsOneWidget);

      bloc.add(HelperEvent9.event7);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey7), findsOneWidget);

      bloc.add(HelperEvent9.event8);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey8), findsOneWidget);

      bloc.add(HelperEvent9.event9);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey9), findsOneWidget);
    });
  });
}
