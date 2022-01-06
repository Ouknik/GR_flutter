import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:qrtest/Model/data_local_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'QR.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(''' 
      CREATE TABLE TableQR (
        name TEXT NOT NULL,
        desk TEXT NOT NULL,
        prx TEXT NOT NULL)
      ''');
    });
  }

  Future<List<DatabseModel>> getAllProdects() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query('TableQR');
    List<DatabseModel> list = maps.isNotEmpty
        ? maps.map((data) => DatabseModel.fromJson(data)).toList()
        : [];

    return list;
  }

  inser(DatabseModel model) async {
    var dbClient = await database;

    await dbClient!.insert('TableQR', model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
