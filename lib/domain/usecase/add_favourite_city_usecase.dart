import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class AddFavouriteCityUseCase implements BaseUseCase<CityModel, bool> {
  final WeatherRepository weatherRepository;

  const AddFavouriteCityUseCase(this.weatherRepository);

  @override
  Future<bool> execute({required CityModel input}) =>
      weatherRepository.addFavouriteCity(input);
}
