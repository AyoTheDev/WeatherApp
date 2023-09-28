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
  Future<CitiesListModelDao> getFavouriteWeathersList() async =>
      database.getAllFavouriteCities();

  @override
  Future<bool> deleteFavouriteWeatherByCity(String city) =>
      database.deleteFavouriteCity(city);

  @override
  Future<bool> addFavouriteCity(String city) =>
      database.addFavouriteCity({"city": city});

  @override
  Future<WeatherModel> fetchWeatherByCity(
      bool isCurrentCity, String? city) async {
    var weather = await weatherApi.fetchWeatherByCity(isCurrentCity, city);
    return WeatherMapper.transformToDomain(weather);
  }
}
