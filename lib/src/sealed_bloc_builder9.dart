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

class SealedBlocBuilder9<
    Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union9<A, B, C, D, E, F, G, H, I>,
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I> extends BlocBuilderBase<Bloc, State> {
  final SealedBlocWidgetBuilder9<State, A, B, C, D, E, F, G, H, I> builder;

  const SealedBlocBuilder9({
    Key key,
    @required this.builder,
    Bloc bloc,
    BlocBuilderCondition<State> condition,
  })  : assert(builder != null),
        super(key: key, bloc: bloc, condition: condition);

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
