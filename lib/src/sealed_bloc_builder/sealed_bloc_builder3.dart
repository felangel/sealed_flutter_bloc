import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin3<A, B, C> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
  Widget Function(C) mapThird,
);

typedef SealedBlocWidgetBuilder3<S extends Union3<A, B, C>, A, B, C> = Widget
    Function(
  BuildContext context,
  WidgetSealedJoin3<A, B, C>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder3<
    Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union3<A, B, C>,
    A,
    B,
    C> extends BlocBuilderBase<Bloc, State> {
  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder3<State, A, B, C> builder;

  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder3({
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
