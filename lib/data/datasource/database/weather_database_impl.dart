import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/models/dao/weather_model_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../exceptions/custom_exception_handler.dart';

// TODO: test DB calls
class WeatherDatabaseImpl implements WeatherDatabase {
  static const _databaseName = 'weather_database';
  static const _tableName = 'weather_table';
  static const _databaseVersion = 1;
  static const _columnCity = 'city';
  static const _columnId = 'id';
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnCity TEXT NOT NULL,
          )
        ''');
      },
      version: _databaseVersion,
    );
  }

  @override
  Future<CitiesListModelDao> getAllFavouriteCities() async {
    final db = await database;

    return await _execute(() async {
      var result = db.query(_tableName);
      return result;
    });
  }

  @override
  Future<bool> addFavouriteCity(CityModelDao city) async {
    final db = await database;

    return await _execute(() async {
      final hasAdded = await db.transaction((txn) async {
        final id = await txn.insert(
          _tableName,
          city,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        final results = await txn
            .query(_tableName, where: '$_columnId = ?', whereArgs: [id]);

        return results.firstOrNull != null;
      });
      return hasAdded;
    });
  }

  @override
  Future<bool> deleteFavouriteCity(String city) async {
    final db = await database;

    return await _execute(() async {
      final count = await db.delete(
        _tableName,
        where: '$_columnCity = ?',
        whereArgs: [city],
      );
      return count == 1;
    });
  }
}

Future<T> _execute<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on Exception catch (e) {
    throw CustomException('${e.toString()} error code');
  }
}
