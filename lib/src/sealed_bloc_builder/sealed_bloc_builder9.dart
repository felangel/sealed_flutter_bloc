import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin9<A, B, C, D, E, F, G, H, I> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
  Widget Function(E) mapFifth,
  Widget Function(F) mapSixth,
  Widget Function(G) mapSeventh,
  Widget Function(H) mapEighth,
  Widget Function(I) mapNinth,
);

typedef SealedBlocWidgetBuilder9<S extends Union9<A, B, C, D, E, F, G, H, I>, A,
        B, C, D, E, F, G, H, I>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin9<A, B, C, D, E, F, G, H, I>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder9<
    Cubit extends bloc.Cubit<State>,
    State extends Union9<A, B, C, D, E, F, G, H, I>,
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I> extends BlocBuilderBase<Cubit, State> {
  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder9({
    Key key,
    @required this.builder,
    Cubit cubit,
    BlocBuilderCondition<State> buildWhen,
  })  : assert(builder != null),
        super(key: key, cubit: cubit, buildWhen: buildWhen);

  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder9<State, A, B, C, D, E, F, G, H, I> builder;

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
