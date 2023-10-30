import 'package:flutter_weather_app/data/models/response/forecast_model_response_wrapper.dart';
import 'package:flutter_weather_app/data/models/response/suggested_city_model_response.dart';
import 'package:flutter_weather_app/data/models/response/weather_model_response.dart';

abstract class WeatherApi {
  Future<Weather> fetchWeatherByCity(bool isCurrent, String? cityName);
  Future<List<SuggestedCitiesResponse>> fetchAutoCompleteSearchData(
      String citySuggestion,
      );
  Future<ForecastModelResponseWrapper> fetchForecastData(
      String cityName,
      );
}