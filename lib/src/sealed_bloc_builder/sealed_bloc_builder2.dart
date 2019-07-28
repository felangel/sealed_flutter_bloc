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

class SealedBlocBuilder2<Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union2<A, B>, A, B> extends BlocBuilderBase<Bloc, State> {
  final SealedBlocWidgetBuilder2<State, A, B> builder;

  const SealedBlocBuilder2({
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
