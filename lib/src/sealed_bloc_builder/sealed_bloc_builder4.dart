import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

/// {@macro sealedblocwidgetbuilder}
typedef WidgetSealedJoin4<A, B, C, D> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
  Widget Function(D) mapFourth,
);

/// {@macro sealedblocwidgetbuilder}
typedef SealedBlocWidgetBuilder4<S extends Union4<A, B, C, D>, A, B, C, D>
    = Widget Function(
  BuildContext context,
  WidgetSealedJoin4<A, B, C, D>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder4<
    Bloc extends bloc.BlocBase<State>,
    State extends Union4<A, B, C, D>,
    A,
    B,
    C,
    D> extends BlocBuilderBase<Bloc, State> {
  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder4({
    Key? key,
    required this.builder,
    Bloc? bloc,
    BlocBuilderCondition<State>? buildWhen,
  }) : super(key: key, bloc: bloc, buildWhen: buildWhen);

  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder4<State, A, B, C, D> builder;

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
