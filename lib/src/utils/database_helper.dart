import 'dart:async';
import 'dart:io';

import 'package:password_saver/src/model/password_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  //? What is that?
  DBProvider._();
  static Database? _database;
  static final DBProvider db = DBProvider._();

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'TestDB.db');
    return openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        print('Database succesfully opnened');
      },
      onCreate: (Database db, int version) async {
        // todo change there
        await db.execute(
          'CREATE TABLE Password ( '
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'description TEXT, '
          'password TEXT '
          ')',
        );
        print('Database succesfully created');
      },
    );
  }

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    // ignore: join_return_with_assignment
    _database = await initDB();
    return _database;
  }

  Future<Password?> getPassword(int id) async {
    final db = await database;
    var res = await db!.query('Password', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Password.fromMap(res.first) : null;
  }

  Future<int> createPassword(Password newPassword) async {
    final db = await database;

    var res = await db!.rawInsert(
        'INSERT Into Client (name, description, password)'
        ' VALUES (${newPassword.name},${newPassword.description},${newPassword.password})');
    return res;
  }

  Future<List<Password>> getAllClients() async {
    final db = await database;
    var res = await db!.query("Client");
    List<Password> list =
        res.isNotEmpty ? res.map((c) => Password.fromMap(c)).toList() : [];
    return list;
  }
}
