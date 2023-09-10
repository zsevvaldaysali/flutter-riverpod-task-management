import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/models/task_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      "CREATE TABLE todos("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "title STRING, description TEXT, date STRING, "
      "startTime STRING, endTime STRING, "
      "remind INTEGER, repeat STRING, "
      "isCompleted INTEGER)",
    );
    await database.execute("CREATE TABLE user("
        "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, "
        "isVerified INTEGER)");
  }

//if we dont have database, we create a database
//open our database
  static Future<sql.Database> db() async {
    return sql.openDatabase('zsevvaldaysali', version: 1, onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

//if we have database then we'll go on to create an item
//create task
  static Future<int> createItem(Task task) async {
    final db = await DBHelper.db();

    final id = await db.insert(
      "todos",
      task.toJson(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> createUser(int isVerified) async {
    final db = await DBHelper.db();

    final data = {
      'id': 1,
      'isVerified': isVerified,
    };

    final id = await db.insert(
      "user",
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

//getting users
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await DBHelper.db();
    return db.query('user', orderBy: 'id');
  }

//getting items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();
    return db.query('todos', orderBy: 'id');
  }

//if we need to update then we need one item
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DBHelper.db();
    return db.query(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
  }

//for update item
  static Future<int> updateItem(
    int id,
    String title,
    String description,
    int isCompleted,
    String date,
    String startTime,
    String endTime,
  ) async {
    final db = await DBHelper.db();
    final data = {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
    };
    final results = await db.update('todos', data, where: 'id = ?', whereArgs: [id]);
    return results;
  }

//delete item from db
  static Future<void> deleteItem(int id) async {
    final db = await DBHelper.db();
    try {
      db.delete('todos', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      debugPrint('Unable to delete $e');
    }
  }
}
