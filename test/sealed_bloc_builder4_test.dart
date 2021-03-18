import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc4.dart';

void main() {
  group('SealedBlocBuilder4', () {
    const targetKey1 = Key('__target1__');
    const targetKey2 = Key('__target2__');
    const targetKey3 = Key('__target3__');
    const targetKey4 = Key('__target4__');

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc4();
      await tester.pumpWidget(
        SealedBlocBuilder4<HelperBloc4, HelperState4, State1, State2, State3,
            State4>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (first) => const SizedBox(key: targetKey1),
              (second) => const SizedBox(key: targetKey2),
              (third) => const SizedBox(key: targetKey3),
              (fourth) => const SizedBox(key: targetKey4),
            );
          },
        ),
      );
      expect(find.byKey(targetKey1), findsOneWidget);

      bloc.add(HelperEvent4.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey2), findsOneWidget);

      bloc.add(HelperEvent4.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey3), findsOneWidget);

      bloc.add(HelperEvent4.event4);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey4), findsOneWidget);
    });
  });
}
