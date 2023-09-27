import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/models/dao/weather_model_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WeatherDatabaseImpl implements WeatherDatabase {
  static const _databaseName = 'weather_database';
  static const _tableName = 'weather_table';
  static const _databaseVersion = 1;
  static const _columnCity = 'city';
  static const _columnId = 'id';
  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDatabase();
    return _database;
  }

  @override
  Future<WeatherModelDao> getAllFavouriteCities() async {
    // TODO: implement getAllFavouriteCities
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavouriteCity(int id) async {
    final db = await database;
    await db?.delete(
      _tableName,
      // where: '$_columnId = ?',    test how it works and delete if not needed
      whereArgs: [id],
    );
  }

  @override
  Future<WeatherModelDao> addFavouriteCity(WeatherModelDao weatherEntity) {
    // TODO: implement addFavouriteCity
    throw UnimplementedError();
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
}
