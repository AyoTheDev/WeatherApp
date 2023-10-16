import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';

import '../repository/weather_repository.dart';

class FetchWeatherByCityUseCase
    implements BaseUseCase<WeatherRequestModel, WeatherModel> {
  final WeatherRepository _weatherRepository;

  const FetchWeatherByCityUseCase(this._weatherRepository);

  @override
  Future<WeatherModel> execute({required WeatherRequestModel input}) async =>
      await _weatherRepository.fetchWeatherByCity(
        input.isCurrent,
        input.cityName,
      );
}

class WeatherRequestModel {
  final bool isCurrent;
  final String? cityName;

  const WeatherRequestModel(this.isCurrent, this.cityName);
}
