import 'package:flutter_weather_app/domain/models/weather_model.dart';

class WeatherMapper {
  //todo: create transformToDomain(toModel) and transformToData(toMap)

  static WeatherModel transformToNewEntityMap(
    final String city,
    final String description,
    final String temperature,
  ) {
    return WeatherModel(
        city: city, description: description, temperature: temperature);
  }
}
