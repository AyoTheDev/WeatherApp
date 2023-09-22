import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/get_weather_by_city_use_case.dart';

class GetWeatherByCityUseCaseImpl implements GetWeatherByCityUseCase {
  final WeatherRepository _weatherRepository;

  const GetWeatherByCityUseCaseImpl(this._weatherRepository);

  @override
  Future<WeatherModel>? execute(String cityName) {
    _weatherRepository.getWeathersList();
  }
}
