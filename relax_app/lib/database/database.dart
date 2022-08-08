import 'package:app_relaxante/database/dao/favourite%20_dao.dart';
import 'package:app_relaxante/database/dao/sound_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future<Database> getDatabase() async{
    final String path = join (await getDatabasesPath(), 'relaxapp.db');
    return openDatabase(path, onCreate: (db, version){
      db.execute(SoundDao.sqlSounds);
      db.execute(FavouriteDao.sqlFavourites);
    }, version: 1,
    //onDowngrade: onDatabaseDowngradeDelete
    );
}

