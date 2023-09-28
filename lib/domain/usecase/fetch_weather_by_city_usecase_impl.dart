import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';

import '../repository/weather_repository.dart';

class FetchWeatherByCityUseCaseImpl
    implements BaseUseCase<WeatherModel, WeatherRequestModel> {
  final WeatherRepository _weatherRepository;

  const FetchWeatherByCityUseCaseImpl(this._weatherRepository);

  @override
  Future<WeatherModel> execute({required WeatherRequestModel input}) async {
    var result = await _weatherRepository.fetchWeatherByCity(input.isCurrent, input.cityName);
      return result;
  }
}

class WeatherRequestModel {
  final bool isCurrent;
  final String? cityName;

  const WeatherRequestModel(this.isCurrent, this.cityName);
}
