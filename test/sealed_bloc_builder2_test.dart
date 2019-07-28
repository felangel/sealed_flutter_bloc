import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sealed_unions/sealed_unions.dart';
import 'package:bloc/bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

class MockUnion extends Mock implements Union2<dynamic, dynamic> {}

class MockBloc extends Mock implements Bloc<dynamic, MockUnion> {}

void main() {
  group('SealedBlocBuilder2', () {
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder2<MockBloc, MockUnion, dynamic, dynamic>(
            builder: null,
          ),
        );
      } catch (error) {
        expect(error, isAssertionError);
      }
    });
  });
}
