import 'package:flutter_weather_app/data/models/dao/weather_model_dao.dart';

abstract class WeatherDatabase {
  Future<WeatherModelDao> getAllFavouriteCities();
  Future<WeatherModelDao> addFavouriteCity(final WeatherModelDao weatherModel);
  Future<void> deleteFavouriteCity(final int id);
}