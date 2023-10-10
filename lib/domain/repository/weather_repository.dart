import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeatherByCity(
      final bool isCurrentCity, final String? city);

  Future<CitiesListModel> getFavouriteWeathersList();

  Future<bool> addFavouriteCity(final String city);

  Future<bool> deleteFavouriteWeatherByCity(final String city);
}
