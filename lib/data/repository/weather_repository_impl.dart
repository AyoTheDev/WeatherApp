import 'package:dio/src/response.dart';
import 'package:flutter_weather_app/data/api/weather_api.dart';
import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/models/dao/weather_model_dao.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatabase database;
  final WeatherApi weatherApi;

  const WeatherRepositoryImpl(this.database, this.weatherApi);

  @override
  Future<WeatherListModelDao> getFavouriteWeathersList() async {
    // TODO: implement getFavouriteWeathersList
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavouriteWeatherByCity(int id, String city) =>
      // TODO: implement deleteFavouriteWeatherByCity
      throw UnimplementedError();

  @override
  Future<WeatherModelDao> addFavouriteWeather(
          String city, String description, String temperature) =>
      // TODO: implement deleteFavouriteWeatherByCity
      throw UnimplementedError();

  @override
  Future<WeatherModel> fetchWeatherByCity(String city) {
    // TODO: implement fetchWeatherByCity
    throw UnimplementedError();
  }
}
