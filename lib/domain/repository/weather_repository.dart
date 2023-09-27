import 'package:flutter_weather_app/data/models/dao/weather_model_dao.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeatherByCity(
      final bool? isCurrentCity, final String? city);

  Future<WeatherListModelDao> getFavouriteWeathersList();

  Future<WeatherModelDao> addFavouriteWeather(
    final String city,
    final String description,
    final String temperature,
  );

  Future<void> deleteFavouriteWeatherByCity(final int id, final String city);
}
