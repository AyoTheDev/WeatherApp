import 'package:flutter_weather_app/data/models/dao/city_model_dao.dart';

abstract class WeatherDatabase {
  Future<CitiesListModelDao> getAllFavouriteCities();
  Future<bool> addFavouriteCity(final CityModelDao city);
  Future<bool> deleteFavouriteCity(final String city);
}