import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import './helpers/helper_bloc1.dart';

void main() {
  group('SealedBlocBuilder1', () {
    const targetKey1 = Key('__target1__');

    testWidgets('should render properly', (tester) async {
      await tester.pumpWidget(
        SealedBlocBuilder1<HelperBloc1, HelperState1, State1>(
          bloc: HelperBloc1(),
          builder: (context, states) {
            return states((first) => const SizedBox(key: targetKey1));
          },
        ),
      );
      expect(find.byKey(targetKey1), findsOneWidget);
    });
  });
}
