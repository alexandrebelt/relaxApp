import 'package:app_relaxante/database/database.dart';
import 'package:app_relaxante/models/favourites.dart';

class FavouriteDao{
  static const String sqlFavourites = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_description TEXT, '
      '$_image TEXT, '
      '$_audio VARCHAR(500),) ';

  static const String _tableName = 'favourites';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _description = 'description';
  static const String _image = 'image';
  static const String _audio = 'audio';

  void save (Favourite favourite){
    getDatabase().then((db){
      final Map<String, dynamic> favouriteMap = Map();
      favouriteMap['sounds'] = favourite.sounds;
    });
  }
}