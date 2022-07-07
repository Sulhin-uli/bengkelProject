import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class MekanikDbProvider {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE mekanik(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        image TEXT, 
        stall TEXT, 
        plat TEXT, 
        isProgress TEXT
      )
      """);
  }

  static Future<int> createItem() async {
    final db = await MekanikDbProvider.db();

    final data = {
      'name': "ABDUL ROHMAN Sr",
      'image': "assets/m1.png",
      "stall": "DIAG 1",
      "plat": "B 1234 YOS",
      "isProgress": "true"
    };
    final id = await db.insert('mekanik', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'bengkel.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await MekanikDbProvider.db();
    return db.query('mekanik', orderBy: "id");
  }
}



// import 'dart:ffi';

// import 'package:projek_bengkel/core/models/mekanik_model.dart';
// import 'package:projek_bengkel/core/models/stall_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'dart:io';
// import 'dart:async';

// class MekanikDbProvider {
//   Future<Database> init() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     final path = join(directory.path, "mekanik.db");

//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute("""
//           CREATE TABLE Mekanik(
//           id INTEGER PRIMARY KEY AUTOINCREMENT,
//           name TEXT,
//           image TEXT, 
//           plat TEXT, 
//           stall_id INTEGER NOT NULL,
//           FOREIGN KEY (stall_id)
//             REFERENCES Stall (id)
//           )""");
//     });
//   }

//   Future<int> addItem(MekanikModel item) async {
//     final db = await init();
//     return db.insert(
//       "Mekanik",
//       item.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.ignore,
//     );
//   }

//   Future<List<MekanikModel>> fetchdata() async {
//     final db = await init();
//     final maps = await db.query("Mekanik");

//     return List.generate(maps.length, (i) {
//       return MekanikModel(
//         id: maps[i]['id'] as int,
//         name: maps[i]['name'] as String,
//         image: maps[i]['image'] as String,
//         stall: StallModel(id: maps[i]['stall_id'] as int),
//         isProgress: maps[i]['isProgress'] as bool,
//       );
//     });
//   }
// }
