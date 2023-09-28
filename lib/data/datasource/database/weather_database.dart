import 'package:flutter_weather_app/data/models/dao/weather_model_dao.dart';

abstract class WeatherDatabase {
  Future<CitiesListModelDao> getAllFavouriteCities();
  Future<bool> addFavouriteCity(final CityModelDao city);
  Future<bool> deleteFavouriteCity(final String city);
}