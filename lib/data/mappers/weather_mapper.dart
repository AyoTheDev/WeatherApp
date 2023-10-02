import 'package:flutter_weather_app/data/models/response/weather_model_response.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';

class WeatherMapper {
  static WeatherModel transformToDomain(final Weather weather) => WeatherModel(
      city: weather.city,
      temperatureF: weather.temperatureF,
      temperatureC: weather.temperatureC,
      description: weather.description);
}
