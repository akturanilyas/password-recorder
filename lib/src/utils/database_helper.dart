import 'dart:async';
import 'dart:io';

import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/model/request/edit_password_request_model.dart';
import 'package:password_saver/src/model/request/password_request_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  //? What is that?
  DBProvider();
  DBProvider._();
  static Database? _database;
  static final DBProvider db = DBProvider._();

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'password.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        print('Database successfully opnened');
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
        print('Database successfully created');
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

  Future<int> createPassword(PasswordRequest newPassword) async {
    final db = await database;

    var res = await db!.insert('Password', newPassword.toMap());

    print('create');
    return res;
  }

  Future<List<Password>> getAllPassword() async {
    final db = await database;
    var res = await db!.query('Password');
    List<Password> list =
        res.isNotEmpty ? res.map((c) => Password.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> updatePassword(EditPasswordRequest editedPassword) async {
    final db = await database;
    var res = await db!.update('Password', editedPassword.toMap(),
        where: 'id = ?', whereArgs: [editedPassword.id]);
    return res;
  }

  Future<void> deletePassword(String id) async {
    final db = await database;
    db!.delete('Password', where: 'id = ?', whereArgs: [id]);
  }
}
