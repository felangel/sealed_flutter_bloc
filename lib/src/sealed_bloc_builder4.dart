import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin4<A, B, C, D> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
);

typedef SealedBlocWidgetBuilder4<S extends Union4<A, B, C, D>, A, B, C, D>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin4<A, B, C, D>,
);

class SealedBlocBuilder4<
    Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union4<A, B, C, D>,
    A,
    B,
    C,
    D> extends BlocBuilderBase<Bloc, State> {
  final SealedBlocWidgetBuilder4<State, A, B, C, D> builder;

  const SealedBlocBuilder4({
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
