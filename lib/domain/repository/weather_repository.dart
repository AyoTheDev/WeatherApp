import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeatherByCity(
    final bool isCurrentCity,
    final String? city,
  );

  Future<List<SuggestedCitiesModel>> fetchAutoCompleteSearchData(
    final String citySuggestion,
  );

  Future<CitiesListModel> getFavouriteCitiesList();

  Future<bool> addFavouriteCity(final CityModel cityModel);

  Future<bool> deleteFavouriteCity(final CityModel cityModel);

  Future<CityModel?> getCityById(final String cityId);

  Future<ForecastModelWrapper> fetchForecastWeatherByCity(
    final String cityName,
  );
}
