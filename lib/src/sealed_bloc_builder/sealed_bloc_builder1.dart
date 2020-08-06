import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin1<A> = Widget Function(
  Widget Function(A) mapFirst,
);

typedef SealedBlocWidgetBuilder1<S extends Union0<A>, A> = Widget Function(
  BuildContext context,
  WidgetSealedJoin1<A>,
);

/// {@template sealedblocbuilder}
/// [SealedBlocBuilder] is a special type of `BlocBuilder` which
/// ensures that every possible [bloc] state has a corresponding `widget`.
/// ```dart
/// SealedBlocBuilder3<MyBloc, MyState, Loading, Success, Failure>(
///   builder: (context, states) => states(
///     (loading) => CircularProgressIndicator(),
///     (success) => Text('Success: ${success.data}'),
///     (failure) => Text('Failure: ${failure.error}'),
///   ),
/// )
/// ```
/// {@endtemplate}
class SealedBlocBuilder1<Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union0<A>, A> extends CubitBuilderBase<Bloc, State> {
  /// {@template sealedblocwidgetbuilder}
  /// [builder] will be called with a `BuildContext` and the
  /// union of all [bloc] states and must return a `widget`
  /// for each possible state.
  /// {@endtemplate}
  final SealedBlocWidgetBuilder1<State, A> builder;

  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder1({
    Key key,
    @required this.builder,
    Bloc bloc,
    CubitBuilderCondition<State> buildWhen,
  })  : assert(builder != null),
        super(key: key, cubit: bloc, buildWhen: buildWhen);

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
