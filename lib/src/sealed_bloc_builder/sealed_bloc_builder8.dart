import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin8<A, B, C, D, E, F, G, H> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
  Widget Function(E) mapFifth,
  Widget Function(F) mapSixth,
  Widget Function(G) mapSeventh,
  Widget Function(H) mapEighth,
);

typedef SealedBlocWidgetBuilder8<S extends Union8<A, B, C, D, E, F, G, H>, A, B,
        C, D, E, F, G, H>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin8<A, B, C, D, E, F, G, H>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder8<
    Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union8<A, B, C, D, E, F, G, H>,
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H> extends CubitBuilderBase<Bloc, State> {
  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder8<State, A, B, C, D, E, F, G, H> builder;

  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder8({
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
