import 'package:app_relaxante/models/sound.dart';
import 'package:hive/hive.dart';

abstract class BaseLocalStorage{
  Future<Box> openBox();
  List<Sound> getFavourite(Box box);
  Future<void> addSoundToFavourite(Box box, Sound sound);
  Future<void> removeSoundFromFavourite(Box box, Sound sound);
}