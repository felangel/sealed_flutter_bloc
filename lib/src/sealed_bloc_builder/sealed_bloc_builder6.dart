import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin6<A, B, C, D, E, F> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
  Widget Function(E) mapFifth,
  Widget Function(F) mapSixth,
);

typedef SealedBlocWidgetBuilder6<S extends Union6<A, B, C, D, E, F>, A, B, C, D,
        E, F>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin6<A, B, C, D, E, F>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder6<
    Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union6<A, B, C, D, E, F>,
    A,
    B,
    C,
    D,
    E,
    F> extends CubitBuilderBase<Bloc, State> {
  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder6<State, A, B, C, D, E, F> builder;

  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder6({
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
