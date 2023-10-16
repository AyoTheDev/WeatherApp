import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class GetCityByIdUseCase implements BaseUseCase<String, CityModel?> {
  final WeatherRepository weatherRepository;

  const GetCityByIdUseCase(this.weatherRepository);

  @override
  Future<CityModel?> execute({required String input}) =>
      weatherRepository.getCityById(input);

}
