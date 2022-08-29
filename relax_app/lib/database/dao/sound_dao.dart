import 'package:app_relaxante/database/database.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:sqflite/sqflite.dart';

class SoundDao{

  static const String sqlSounds = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_description TEXT, '
      '$_image TEXT, '
      '$_audio VARCHAR(500),'
      '$_favourite INT NOT NULL) ';

  static const String _tableName = 'sounds';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _description = 'description';
  static const String _image = 'image';
  static const String _audio = 'audio';
  static const String _favourite = 'favourite';

  Future<int> save(Sound sound) async {
    final Database db = await getDatabase();
    Map<String, dynamic> soundMap = _toMap(sound);
    return db.insert(_tableName, soundMap);
  }

  Future<int> delete(int id) async{
    final Database db = await getDatabase();
    return await db.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Sound sound) async{
    final Database db = await getDatabase();
    return await db.update(
      _tableName,
      _toMap(sound),
      where: '$_id = ?',
      whereArgs: [sound.id],);
  }

  Future<List<Sound>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    List<Sound> sounds = _toList(maps);
    return sounds;
  }

  Map<String, dynamic> _toMap(Sound sound) {
    final Map<String, dynamic> soundMap = Map();
    soundMap[_name] = sound.name;
    soundMap[_description] = sound.description;
    soundMap[_image] = sound.image;
    soundMap[_audio] = sound.audio;
    soundMap[_favourite] = sound.favourite;
    return soundMap;
  }

  List<Sound> _toList(List<Map<String, dynamic>> maps) {
    final List<Sound> sounds = [];
    for (Map<String, dynamic> map in maps) {
      final Sound sound = Sound(
        map[_id],
        map[_name],
        map[_description],
        map[_image],
        map[_audio],
        map[_favourite],
      );
      sounds.add(sound);
    }
    return sounds;
  }


  Future<List<Sound>> findFavs() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    List<Sound> sounds = _toListFav(maps)!;
    return sounds;
  }

  List<Sound> ?_toListFav(List<Map<String, dynamic>> maps) {
    final List<Sound> sounds = [];
    for (Map<String, dynamic> map in maps) {
      if(_favourite != '0'){
        final Sound sound = Sound(
          map[_id],
          map[_name],
          map[_description],
          map[_image],
          map[_audio],
          map[_favourite],
        );
        sounds.add(sound);
        return sounds;
      }
    }
  }
}