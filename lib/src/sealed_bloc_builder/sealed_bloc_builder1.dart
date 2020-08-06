import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin1<A> = Widget Function(
  Widget Function(A) mapFirst,
);

typedef SealedBlocWidgetBuilder1<S extends Union0<A>, A> = Widget Function(
  BuildContext context,
  WidgetSealedJoin1<A>,
);

/// {@template sealedblocbuilder}
/// `SealedBlocBuilder` is a special type of [BlocBuilder] which
/// ensures that every possible [Cubit] state has a corresponding [Widget].
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
class SealedBlocBuilder1<Cubit extends bloc.Cubit<State>,
    State extends Union0<A>, A> extends BlocBuilderBase<Cubit, State> {
  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder1({
    Key key,
    @required this.builder,
    Cubit cubit,
    BlocBuilderCondition<State> buildWhen,
  })  : assert(builder != null),
        super(key: key, cubit: cubit, buildWhen: buildWhen);

  /// {@template sealedblocwidgetbuilder}
  /// [builder] will be called with a [BuildContext] and the
  /// union of all [Cubit] states and must return a [Widget]
  /// for each possible state.
  /// {@endtemplate}
  final SealedBlocWidgetBuilder1<State, A> builder;

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
