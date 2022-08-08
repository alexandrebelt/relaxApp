import 'package:app_relaxante/models/sound.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable{
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}
class StartFavourite extends FavouriteEvent{}

class AddFavouriteSound extends FavouriteEvent{
  final Sound sound;
  const AddFavouriteSound(this.sound);

  @override
  List<Object> get props => [sound];
}

class RemoveFavouriteSound extends FavouriteEvent{
  final Sound sound;
  const RemoveFavouriteSound(this.sound);

  @override
  List<Object> get props => [sound];
}