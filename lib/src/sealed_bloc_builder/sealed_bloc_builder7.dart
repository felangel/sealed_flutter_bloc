import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

/// {@macro sealedblocwidgetbuilder}
typedef WidgetSealedJoin7<A, B, C, D, E, F, G> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
  Widget Function(E) mapFifth,
  Widget Function(F) mapSixth,
  Widget Function(G) mapSeventh,
);

/// {@macro sealedblocwidgetbuilder}
typedef SealedBlocWidgetBuilder7<S extends Union7<A, B, C, D, E, F, G>, A, B, C,
        D, E, F, G>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin7<A, B, C, D, E, F, G>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder7<
    Bloc extends bloc.BlocBase<State>,
    State extends Union7<A, B, C, D, E, F, G>,
    A,
    B,
    C,
    D,
    E,
    F,
    G> extends BlocBuilderBase<Bloc, State> {
  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder7({
    Key? key,
    required this.builder,
    Bloc? bloc,
    BlocBuilderCondition<State>? buildWhen,
  }) : super(key: key, bloc: bloc, buildWhen: buildWhen);

  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder7<State, A, B, C, D, E, F, G> builder;

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
