import 'package:equatable/equatable.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

class Fetch extends Equatable {}

class PostEvent extends Union0Impl<Fetch> {
  static final unions = const Nullet<Fetch>();

  PostEvent._(Union0<Fetch> union) : super(union);

  factory PostEvent.fetch() => PostEvent._(unions.first(Fetch()));
}
