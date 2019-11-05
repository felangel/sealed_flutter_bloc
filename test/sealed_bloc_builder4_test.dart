import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc4.dart';

void main() {
  group('SealedBlocBuilder4', () {
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder4<HelperBloc4, HelperState4, State1, State2, State3,
              State4>(
            bloc: HelperBloc4(),
            builder: null,
          ),
        );
      } on Object catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc4();
      await tester.pumpWidget(
        SealedBlocBuilder4<HelperBloc4, HelperState4, State1, State2, State3,
            State4>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (State1 first) => Container(key: Key('__target1__')),
              (State2 second) => Container(key: Key('__target2__')),
              (State3 third) => Container(key: Key('__target3__')),
              (State4 fourth) => Container(key: Key('__target4__')),
            );
          },
        ),
      );
      expect(find.byKey(Key('__target1__')), findsOneWidget);

      bloc.add(HelperEvent4.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target2__')), findsOneWidget);

      bloc.add(HelperEvent4.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target3__')), findsOneWidget);

      bloc.add(HelperEvent4.event4);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target4__')), findsOneWidget);
    });
  });
}
