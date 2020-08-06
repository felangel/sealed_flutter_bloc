import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin5<A, B, C, D, E> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
  Widget Function(E) mapFifth,
);

typedef SealedBlocWidgetBuilder5<S extends Union5<A, B, C, D, E>, A, B, C, D, E>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin5<A, B, C, D, E>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder5<
    Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union5<A, B, C, D, E>,
    A,
    B,
    C,
    D,
    E> extends CubitBuilderBase<Bloc, State> {
  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder5<State, A, B, C, D, E> builder;

  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder5({
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
