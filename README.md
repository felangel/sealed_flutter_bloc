<p align="center">
  <img src="https://github.com/felangel/sealed_flutter_bloc/raw/master/doc/assets/sealed_flutter_bloc.png" width="50%" alt="logo" />
  <br/>
  <a href="https://circleci.com/gh/felangel/sealed_flutter_bloc">
    <img alt="Build Status" src="https://circleci.com/gh/felangel/sealed_flutter_bloc.svg?style=shield">
  </a>
  <a href="https://codecov.io/gh/felangel/sealed_flutter_bloc">
    <img alt="Code Coverage" src="https://codecov.io/gh/felangel/sealed_flutter_bloc/branch/master/graph/badge.svg" />
  </a>
  <a href="https://pub.dartlang.org/packages/sealed_flutter_bloc">
    <img alt="Pub Package" src="https://img.shields.io/pub/v/sealed_flutter_bloc.svg">
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img alt="MIT License" src="https://img.shields.io/badge/License-MIT-blue.svg">
  </a>  
</p>
<i>
  <p align="center"><a href="https://pub.dev/packages/flutter_bloc">flutter_bloc</a> meets <a href="https://pub.dev/packages/sealed_union">sealed_unions</a>
  </p>
</i>

---

## Quick Start

### Extend `UnionNImpl`

```dart
class MyState extends Union4Impl<Initial, Loading, Success, Failure> {
  static final unions = const Quartet<Initial, Loading, Success, Failure>();

  MyState._(Union4<Initial, Loading, Success, Failure> union) : super(union);

  factory MyState.initial() => MyState._(unions.first(Initial()));

  factory MyState.loading() => MyState._(unions.second(Loading()));

  factory MyState.success({String data}) =>
      MyState._(unions.third(Success(data: data)));

  factory MyState.failure({String error}) =>
      MyState._(unions.fourth(Failure(error: error)));
}

class Initial {}

class Loading {}

class Success {
  final String data;

  Success({this.data});
}

class Failure {
  String error;

  Failure({this.error});
}
```

### Use `SealedBlocBuilder`

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SealedBlocBuilder4<MyBloc, MyState, Initial, Loading, Success,
        Failure>(
      builder: (context, states) => states(
        (initial) => Text('Initial'),
        (loading) => CircularProgressIndicator(),
        (success) => Text('Success: ${success.data}'),
        (failure) => Text('Failure: ${failure.error}'),
      ),
    );
  }
}
```

## Additional Examples

More examples can be found at [sealed_flutter_bloc_samples](https://github.com/felangel/sealed_flutter_bloc_samples).
