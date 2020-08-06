import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin2<A, B> = Widget Function(
  Widget Function(A) mapFirst,
  Widget Function(B) mapSecond,
);

typedef SealedBlocWidgetBuilder2<S extends Union2<A, B>, A, B> = Widget
    Function(
  BuildContext context,
  WidgetSealedJoin2<A, B>,
);

/// {@macro sealedblocbuilder}
class SealedBlocBuilder2<Cubit extends bloc.Cubit<State>,
    State extends Union2<A, B>, A, B> extends BlocBuilderBase<Cubit, State> {
  /// {@macro sealedblocbuilder}
  const SealedBlocBuilder2({
    Key key,
    @required this.builder,
    Cubit cubit,
    BlocBuilderCondition<State> buildWhen,
  })  : assert(builder != null),
        super(key: key, cubit: cubit, buildWhen: buildWhen);

  /// {@macro sealedblocwidgetbuilder}
  final SealedBlocWidgetBuilder2<State, A, B> builder;

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}
