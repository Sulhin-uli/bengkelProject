import 'package:projek_bengkel/core/models/stall_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class StallDbProvider {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "stall.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE Stall(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          code TEXT)""");
    });
  }

  Future<int> addItem(StallModel item) async {
    final db = await init();
    return db.insert(
      "Stall",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<StallModel>> fetchdata() async {
    final db = await init();
    final maps = await db.query("Stall");

    return List.generate(maps.length, (i) {
      return StallModel(
        id: maps[i]['id'] as int,
        code: maps[i]['code'] as String,
      );
    });
  }
}
