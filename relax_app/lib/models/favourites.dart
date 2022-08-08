import 'package:app_relaxante/models/sound.dart';
import 'package:equatable/equatable.dart';

class Favourite extends Equatable{
  final List<Sound> sounds;
  const Favourite({this.sounds = const <Sound>[]});
  @override
  // TODO: implement props
  List<Object> get props => [sounds];
}