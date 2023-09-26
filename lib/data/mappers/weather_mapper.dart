import 'package:flutter_weather_app/domain/models/weather_model.dart';

class WeatherMapper {
  //todo: create transformToDomain(toModel) and transformToData(toMap)

  static WeatherModel transformToNewEntityMap(
    final String city,
    final String temperature,
    final String description,
  ) {
    return WeatherModel(
        city: city, temperature: temperature, description: description,
    );
  }
}
