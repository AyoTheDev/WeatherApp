import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class FetchForecastUseCase
    implements BaseUseCase<String, ForecastModelWrapper> {
  final WeatherRepository weatherRepository;

  const FetchForecastUseCase(this.weatherRepository);

  @override
  Future<ForecastModelWrapper> execute({required String input}) =>
      weatherRepository.fetchForecastWeatherByCity(input);
}
