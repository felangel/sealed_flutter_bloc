import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc3.dart';

void main() {
  group('SealedBlocBuilder3', () {
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder3<HelperBloc3, HelperState3, State1, State2, State3>(
            bloc: HelperBloc3(),
            builder: null,
          ),
        );
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc3();
      await tester.pumpWidget(
        SealedBlocBuilder3<HelperBloc3, HelperState3, State1, State2, State3>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (State1 first) => Container(key: Key('__target1__')),
              (State2 second) => Container(key: Key('__target2__')),
              (State3 third) => Container(key: Key('__target3__')),
            );
          },
        ),
      );
      expect(find.byKey(Key('__target1__')), findsOneWidget);

      bloc.add(HelperEvent3.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target2__')), findsOneWidget);

      bloc.add(HelperEvent3.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target3__')), findsOneWidget);
    });
  });
}
