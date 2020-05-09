import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import './helpers/helper_bloc1.dart';

void main() {
  group('SealedBlocBuilder1', () {
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder1<HelperBloc1, HelperState1, State1>(
            bloc: HelperBloc1(),
            builder: null,
          ),
        );
      } on Object catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should render properly', (tester) async {
      await tester.pumpWidget(
        SealedBlocBuilder1<HelperBloc1, HelperState1, State1>(
          bloc: HelperBloc1(),
          builder: (context, states) {
            return states((first) => Container(key: Key('__target1__')));
          },
        ),
      );
      expect(find.byKey(Key('__target1__')), findsOneWidget);
    });
  });
}
