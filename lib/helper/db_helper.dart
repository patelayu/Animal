import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../global/globels.dart';
import '../models/model.dart';


class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  String dbName = "Animal.db";
  String tableName = "Animals_data";
  String colId = "id";
  String colName = "name";
  String colDescription = "description";
  String colImage = "image";
  String colType = "type";

  Database? db;

  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          String query =
              "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colDescription TEXT, $colImage TEXT, $colType TEXT);";
          await db.execute(query);

        });
  }

  Future<void> insertData() async {
    await init();

    for(var e in Global.animalData) {

      AnimalDB data = AnimalDB.fromMap(data: e);
      String query =
          "INSERT INTO $tableName($colName,$colDescription,$colImage,$colType)VALUES(?,?,?,?);";
      List args = [data.name, data.description, data.image, data.type];
      int res = await db!.rawInsert(query, args);
    }
  }

  Future<List<Animal>> fetchData({required String type}) async {
    await init();
    await insertData();
    String query = "SELECT * FROM $tableName WHERE $colType='$type';";
    List<Map<String, dynamic>> dbData = await db!.rawQuery(query);
    return dbData.map((e) => Animal.fromMap(e)).toList();
  }
}