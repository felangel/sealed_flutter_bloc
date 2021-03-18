import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc5.dart';

void main() {
  group('SealedBlocBuilder5', () {
    const targetKey1 = Key('__target1__');
    const targetKey2 = Key('__target2__');
    const targetKey3 = Key('__target3__');
    const targetKey4 = Key('__target4__');
    const targetKey5 = Key('__target5__');

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc5();
      await tester.pumpWidget(
        SealedBlocBuilder5<HelperBloc5, HelperState5, State1, State2, State3,
            State4, State5>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (first) => const SizedBox(key: targetKey1),
              (second) => const SizedBox(key: targetKey2),
              (third) => const SizedBox(key: targetKey3),
              (fourth) => const SizedBox(key: targetKey4),
              (fifth) => const SizedBox(key: targetKey5),
            );
          },
        ),
      );
      expect(find.byKey(targetKey1), findsOneWidget);

      bloc.add(HelperEvent5.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey2), findsOneWidget);

      bloc.add(HelperEvent5.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey3), findsOneWidget);

      bloc.add(HelperEvent5.event4);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey4), findsOneWidget);

      bloc.add(HelperEvent5.event5);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey5), findsOneWidget);
    });
  });
}
