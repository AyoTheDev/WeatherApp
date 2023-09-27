import 'package:flutter_weather_app/data/api/weather_api.dart';
import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/mappers/weather_mapper.dart';
import 'package:flutter_weather_app/data/models/dao/weather_model_dao.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatabase database;
  final WeatherApi weatherApi;

  const WeatherRepositoryImpl(this.database, this.weatherApi);

  @override
  Future<WeatherListModelDao> getFavouriteWeathersList() async =>
      database.getAllFavouriteCities();

  @override
  Future<void> deleteFavouriteWeatherByCity(int id, String city) =>
      database.deleteFavouriteCity(id, city);

  @override
  Future<WeatherModelDao> addFavouriteWeather(
          String city, String description, String temperature) =>
      // TODO: implement addFavouriteWeather
      throw UnimplementedError();

  @override
  Future<WeatherModel> fetchWeatherByCity(
      bool? isCurrentCity, String? city) async {
    var weather = await weatherApi.fetchWeatherByCity(isCurrentCity, city);
    return WeatherMapper.transformToDomain(weather!);
  }
}
