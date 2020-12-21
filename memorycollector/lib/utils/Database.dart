import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:memorycollector/model/memory.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'memorycollector.db'),
        onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE memory(
          title TEXT PRIMARY KEY, description TEXT, image URL, date DATETIME
          )
        ''');
    }, version: 1);
  }

  newMemory(Memory newMemory) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO memory (
        title, description, image, date
      ) VALUES(?,?,?,?)
    ''', [newMemory.title, newMemory.description,  newMemory.date]); //newMemory.image,

    return res;
  }

  Future<dynamic> getMemory() async{
    final db = await database;
    var res = await db.query("memory");
    if(res.length == 0){
      return null;
    } else{
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;

    }
  }
}
