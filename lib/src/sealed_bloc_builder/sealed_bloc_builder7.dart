import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin7<A, B, C, D, E, F, G> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
  Widget Function(E) mapFifth,
  Widget Function(F) mapSixth,
  Widget Function(G) mapSeventh,
);

typedef SealedBlocWidgetBuilder7<S extends Union7<A, B, C, D, E, F, G>, A, B, C,
        D, E, F, G>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin7<A, B, C, D, E, F, G>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder7<
    Cubit extends bloc.Cubit<State>,
    State extends Union7<A, B, C, D, E, F, G>,
    A,
    B,
    C,
    D,
    E,
    F,
    G> extends BlocBuilderBase<Cubit, State> {
  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder7({
    Key key,
    @required this.builder,
    Cubit cubit,
    BlocBuilderCondition<State> buildWhen,
  })  : assert(builder != null),
        super(key: key, cubit: cubit, buildWhen: buildWhen);

  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder7<State, A, B, C, D, E, F, G> builder;

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
