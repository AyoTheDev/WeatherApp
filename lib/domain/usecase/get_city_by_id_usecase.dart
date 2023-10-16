import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class GetCityByIdUseCaseImpl implements BaseUseCase<String, CityModel?> {
  final WeatherRepository weatherRepository;

  const GetCityByIdUseCaseImpl(this.weatherRepository);

  @override
  Future<CityModel?> execute({required String input}) =>
      weatherRepository.getCityById(input);

}
