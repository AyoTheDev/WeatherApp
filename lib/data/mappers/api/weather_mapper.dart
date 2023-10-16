import 'package:flutter_weather_app/data/models/response/weather_model_response.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';

class WeatherMapper {
  static WeatherModel transformWeatherModelToDomain(final Weather weather) =>
      WeatherModel(
        city: weather.city,
        country: weather.country,
        temperatureF: weather.temperatureF,
        temperatureC: weather.temperatureC,
        description: weather.description,
        isFavourite: false,
        icon: "${Strings.https}${weather.icon}",
        windDir: weather.windDir,
      );
}
