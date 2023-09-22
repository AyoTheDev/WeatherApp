import 'package:flutter_weather_app/domain/models/weather_model.dart';

abstract class GetWeatherByCityUseCase {
  Future<WeatherModel>? execute(String cityName);
}