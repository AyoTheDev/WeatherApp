import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class DeleteFavouriteCityUseCase implements BaseUseCase<CityModel, bool> {
  final WeatherRepository _weatherRepository;

  const DeleteFavouriteCityUseCase(this._weatherRepository);

  @override
  Future<bool> execute({required CityModel input}) =>
      _weatherRepository.deleteFavouriteCity(input);
}
