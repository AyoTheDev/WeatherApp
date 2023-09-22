import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/models/dao/weather_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WeatherDatabaseImpl implements WeatherDatabase {
  static const _databaseName = 'weather_database';
  static const _tableName = 'weather_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnTitle = 'city';
  static const _columnDescription = 'description';
  static const _columnTemperature = 'temperature';
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  @override
  Future<WeatherListModel> allCities() async {
    final db = await database;
    return db.query(_tableName);
  }

  @override
  Future<void> deleteWeather(int id) {
    // TODO: implement deleteWeather
    throw UnimplementedError();
  }

  @override
  Future<WeatherModel> createWeather(WeatherModel weatherEntity) {
    // TODO: implement insertWeather
    throw UnimplementedError();
  }

  @override
  Future<void> updateWeather(WeatherModel weatherListModel) async {
    final db = await database;
    final id = weatherListModel['id'];
    await db.update(
      _tableName,
      weatherListModel,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnTitle TEXT NOT NULL,
            $_columnDescription TEXT,
            $_columnTemperature TEXT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }
}
