import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static Database _db;
  DatabaseHelper.internal();

  final _lock = new Lock();
  String sqlCreate = '''
  create table if not exists members(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    first_name TEXT, 
    last_name TEXT, 
    email TEXT, 
    telephone TEXT, 
    birth_date TEXT, 
    image TEXT)
  ''';

  Future<Database> getDb() async {
    if (_db == null) {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentDirectory.path, 'mydb.db');
      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await openDatabase(path, version: 1);
        }
      });
    }
    return _db;
  }

  Future initDatabase() async {
    var dbClient = await getDb();
    // Create table
    await dbClient.rawQuery(sqlCreate);
    print('Table is created');
  }



}

class MembersService{
  DatabaseHelper databaseHelper = new DatabaseHelper.internal();

  Future save(Map member) async {

    var dbClient = await databaseHelper.getDb();

    String sql='''
    INSERT INTO members(first_name,last_name,email,telephone,birth_date)
    VALUES(?,?,?,?,?)
    ''';

    await dbClient.rawQuery(sql,[
      member['firstName'],
      member['lastName'],
      member['email'],
      member['telephone'],
      member['birthDate'],
    ]);

    print('Saved !!');
  }

  Future findAll() async{
    var dbClient = await databaseHelper.getDb();
    var sql='SELECT * FROM members ORDER BY id';
    return await dbClient.rawQuery(sql);
  }

  Future remove(int id) async{
    var dbClient = await databaseHelper.getDb();
    var sql='DELETE FROM members WHERE id=?';
    return await dbClient.rawQuery(sql,[id]);
  }

}