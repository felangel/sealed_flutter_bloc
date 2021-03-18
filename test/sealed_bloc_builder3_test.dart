import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc3.dart';

void main() {
  group('SealedBlocBuilder3', () {
    const targetKey1 = Key('__target1__');
    const targetKey2 = Key('__target2__');
    const targetKey3 = Key('__target3__');

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc3();
      await tester.pumpWidget(
        SealedBlocBuilder3<HelperBloc3, HelperState3, State1, State2, State3>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (first) => const SizedBox(key: targetKey1),
              (second) => const SizedBox(key: targetKey2),
              (third) => const SizedBox(key: targetKey3),
            );
          },
        ),
      );
      expect(find.byKey(targetKey1), findsOneWidget);

      bloc.add(HelperEvent3.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey2), findsOneWidget);

      bloc.add(HelperEvent3.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey3), findsOneWidget);
    });
  });
}
