import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/mappers/weather_mapper.dart';
import 'package:flutter_weather_app/data/models/dao/weather_model.dart';
import 'package:flutter_weather_app/data/mappers/weather_list_mapper.dart';

import '../../domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatabase database;

  const WeatherRepositoryImpl(this.database);

  @override
  Future<WeatherListModel> getWeathersList() async {
    final weatherListModel = await database.allCities();
    return WeatherListMapper.transformToModel(weatherListModel);
  }

  @override
  Future<void> deleteWeather(int id) {
    // TODO: implement logic
    throw UnimplementedError();
  }

  @override
  Future<WeatherModel> createWeather(final String title, final String description, final String temperature) async {
    //todo: implement logic
    throw UnimplementedError();
  }

  @override
  Future<void> updateWeather(int id, String title, String description, String temperature) {
    // TODO: implement logic
    throw UnimplementedError();
  }
}
