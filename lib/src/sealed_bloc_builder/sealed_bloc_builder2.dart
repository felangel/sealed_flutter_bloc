import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

/// {@macro sealedblocwidgetbuilder}
typedef WidgetSealedJoin2<A, B> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
);

/// {@macro sealedblocwidgetbuilder}
typedef SealedBlocWidgetBuilder2<S extends Union2<A, B>, A, B> = Widget
    Function(
  BuildContext context,
  WidgetSealedJoin2<A, B>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder2<Bloc extends bloc.BlocBase<State>,
    State extends Union2<A, B>, A, B> extends BlocBuilderBase<Bloc, State> {
  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder2({
    Key? key,
    required this.builder,
    Bloc? bloc,
    BlocBuilderCondition<State>? buildWhen,
  }) : super(key: key, bloc: bloc, buildWhen: buildWhen);

  /// {@m?acro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder2<State, A, B> builder;

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
