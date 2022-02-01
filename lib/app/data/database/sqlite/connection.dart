import 'package:path/path.dart';
import 'package:rv_crud_challenger/app/data/database/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Connection {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), 'banco_product');
      deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db,v){
          db.execute(createTable);
          db.execute(insert);
        } 
      );
    }
    return _db!;
  }
}
