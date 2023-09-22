import 'package:flutter_weather_app/data/models/dao/weather_model.dart';

abstract class WeatherDatabase {
  Future<WeatherListModel> allCities();
  Future<WeatherModel> createWeather(final WeatherModel weatherEntity);
  Future<void> updateWeather(final WeatherModel weatherEntity);
  Future<void> deleteWeather(final int id);
}