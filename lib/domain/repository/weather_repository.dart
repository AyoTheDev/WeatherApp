import 'package:flutter_weather_app/data/models/dao/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherListModel>? getWeathersList();
  Future<WeatherModel> createWeather(
      final String title,
      final String description,
      final String temperature,
      );
  Future<void> updateWeather(
      final int id,
      final String title,
      final String description,
      final String temperature,
      );
  Future<void> deleteWeather(final int id);
}