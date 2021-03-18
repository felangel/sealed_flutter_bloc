import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

/// {@macro sealedblocwidgetbuilder}
typedef WidgetSealedJoin6<A, B, C, D, E, F> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
  Widget Function(E) mapFifth,
  Widget Function(F) mapSixth,
);

/// {@macro sealedblocwidgetbuilder}
typedef SealedBlocWidgetBuilder6<S extends Union6<A, B, C, D, E, F>, A, B, C, D,
        E, F>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin6<A, B, C, D, E, F>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder6<
    Bloc extends bloc.BlocBase<State>,
    State extends Union6<A, B, C, D, E, F>,
    A,
    B,
    C,
    D,
    E,
    F> extends BlocBuilderBase<Bloc, State> {
  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder6({
    Key? key,
    required this.builder,
    Bloc? bloc,
    BlocBuilderCondition<State>? buildWhen,
  }) : super(key: key, bloc: bloc, buildWhen: buildWhen);

  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder6<State, A, B, C, D, E, F> builder;

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
