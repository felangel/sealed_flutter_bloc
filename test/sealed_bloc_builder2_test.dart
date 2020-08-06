import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc2.dart';

void main() {
  group('SealedBlocBuilder2', () {
    const targetKey1 = Key('__target1__');
    const targetKey2 = Key('__target2__');
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder2<HelperBloc2, HelperState2, State1, State2>(
            cubit: HelperBloc2(),
            builder: null,
          ),
        );
      } on Object catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc2();
      await tester.pumpWidget(
        SealedBlocBuilder2<HelperBloc2, HelperState2, State1, State2>(
          cubit: bloc,
          builder: (context, states) {
            return states(
              (first) => const SizedBox(key: targetKey1),
              (second) => const SizedBox(key: targetKey2),
            );
          },
        ),
      );
      expect(find.byKey(targetKey1), findsOneWidget);

      bloc.add(HelperEvent2.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(targetKey2), findsOneWidget);
    });
  });
}
