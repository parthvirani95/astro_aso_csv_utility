// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:astro_aso_csv_utility/globals.dart';
import 'package:astro_aso_csv_utility/models/app_list_model.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get astroDatabase async {
    if (_database != null) return _database!;

    _database = await _initDB('Model.sqlite');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = '$csvKitDocumentPath${Platform.pathSeparator}astro_backup';
    final path = p.join(dbPath, fileName);
    return await openDatabase(path);
  }

  Future<List<AppListModel>> getAppNameAndIds() async {
    final db = await instance.astroDatabase;
    final rows = await db.rawQuery('SELECT ZAPPID, ZNAME, ZPLATFORM FROM ZAPPLICATION;');
    final appList = <AppListModel>[];

    for (var row in rows) {
      appList.add(AppListModel.fromJson(row));
    }

    return appList;
  }
}
