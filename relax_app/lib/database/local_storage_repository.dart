import 'package:app_relaxante/database/base_local_repository.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:hive/hive.dart';

class LocalStorageRepository extends BaseLocalStorage{
  String boxName = 'favourites';

  @override
  Future<Box> openBox() async{
    Box box = await Hive.openBox<Sound>(boxName);
    return box;
  }

  @override
  List<Sound> getFavourite(Box box) {
    return box.values.toList() as List<Sound>;
  }

  @override
  Future<void> addSoundToFavourite(Box box, Sound sound) async {
    await box.put(sound.id, sound);
    box.putAt(sound.id, sound.favourite = 1);
  }

  @override
  Future<void> removeSoundFromFavourite(Box box, Sound sound) async {
    await box.delete(sound.id);
  }
}