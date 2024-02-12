<p align="center">
  <img src="https://github.com/felangel/sealed_flutter_bloc/raw/master/doc/assets/sealed_flutter_bloc_logo_full.png" height="100" alt="Sealed Flutter Bloc">
</p>

<p align="center">
  <a href="https://github.com/felangel/bloc/actions"><img src="https://github.com/felangel/bloc/workflows/build/badge.svg" alt="build"></a>
  <a href="https://codecov.io/gh/felangel/bloc"><img src="https://codecov.io/gh/felangel/Bloc/branch/master/graph/badge.svg" alt="codecov"></a>
  <a href="https://github.com/felangel/bloc"><img src="https://img.shields.io/github/stars/felangel/bloc.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
  <a href="https://github.com/tenhobi/effective_dart"><img src="https://img.shields.io/badge/style-effective_dart-40c4ff.svg" alt="style: effective dart"></a>
  <a href="https://flutter.dev/docs/development/data-and-backend/state-mgmt/options#bloc--rx"><img src="https://img.shields.io/badge/flutter-website-deepskyblue.svg" alt="Flutter Website"></a>
  <a href="https://github.com/Solido/awesome-flutter#standard"><img src="https://img.shields.io/badge/awesome-flutter-blue.svg?longCache=true" alt="Awesome Flutter"></a>
  <a href="https://fluttersamples.com"><img src="https://img.shields.io/badge/flutter-samples-teal.svg?longCache=true" alt="Flutter Samples"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
  <a href="https://discord.gg/Hc5KD3g"><img src="https://img.shields.io/discord/649708778631200778.svg?logo=discord&color=blue" alt="Discord"></a>
  <a href="https://github.com/felangel/bloc"><img src="https://tinyurl.com/bloc-library" alt="Bloc Library"></a>
</p>

<i>
  <p align="center"><a href="https://pub.dev/packages/flutter_bloc">flutter_bloc</a> meets <a href="https://pub.dev/packages/sealed_unions">sealed_unions</a>
  </p>
</i>

---

## Sponsors

Our top sponsors are shown below! [[Become a Sponsor](https://github.com/sponsors/felangel)]

<table>
    <tbody>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://www.monterail.com/services/flutter-development/?utm_source=bloc&utm_medium=logo&utm_campaign=flutter"><img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/monterail_logo.svg" width="225"/></a>
            </td>
            <td align="center" style="background-color: white">
                <a href="https://getstream.io/chat/flutter/tutorial/?utm_source=Github&utm_medium=Github_Repo_Content_Ad&utm_content=Developer&utm_campaign=Github_Jan2022_FlutterChat&utm_term=bloc" target="_blank"><img width="250px" src="https://stream-blog.s3.amazonaws.com/blog/wp-content/uploads/fc148f0fc75d02841d017bb36e14e388/Stream-logo-with-background-.png"/></a><br/><span><a href="https://getstream.io/chat/flutter/tutorial/?utm_source=Github&utm_medium=Github_Repo_Content_Ad&utm_content=Developer&utm_campaign=Github_Jan2022_FlutterChat&utm_term=bloc" target="_blank">Try the Flutter Chat Tutorial &nbsp💬</a></span>
            </td>
            <td align="center" style="background-color: white">
                <a href="https://www.miquido.com/flutter-development-company/?utm_source=github&utm_medium=sponsorship&utm_campaign=bloc-silver-tier&utm_term=flutter-development-company&utm_content=miquido-logo"><img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/miquido_logo.png" width="225"/></a>
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://bit.ly/parabeac_flutterbloc"><img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/parabeac_logo.png" width="225"/></a>
            </td>
            <td align="center" style="background-color: white">
                <a href="https://www.netguru.com/services/flutter-app-development?utm_campaign=%5BS%5D%5BMob%5D%20Flutter&utm_source=github&utm_medium=sponsorship&utm_term=bloclibrary"><img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/netguru_logo.png" width="225"/></a>
            </td>
        </tr>
    </tbody>
</table>

---

## Quick Start

### Extend `UnionNImpl`

```dart
class MyState extends Union4Impl<Initial, Loading, Success, Failure> {
  static final unions = const Quartet<Initial, Loading, Success, Failure>();

  MyState._(Union4<Initial, Loading, Success, Failure> union) : super(union);

  factory MyState.initial() => MyState._(unions.first(Initial()));

  factory MyState.loading() => MyState._(unions.second(Loading()));

  factory MyState.success({required String data}) =>
      MyState._(unions.third(Success(data: data)));

  factory MyState.failure({required String error}) =>
      MyState._(unions.fourth(Failure(error: error)));
}

class Initial {}

class Loading {}

class Success {
  final String data;

  Success({required this.data});
}

class Failure {
  String error;

  Failure({required this.error});
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
