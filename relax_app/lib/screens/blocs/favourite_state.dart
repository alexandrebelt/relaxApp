import 'package:app_relaxante/models/favourites.dart';
import 'package:equatable/equatable.dart';


abstract class FavouriteState extends Equatable{
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final Favourite favourite;

  const FavouriteLoaded({this.favourite = const Favourite()});
  @override
  List<Object> get props => [favourite];
}

class FavouriteError  extends FavouriteState {}