import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class DeleteFavouriteCityUseCaseImpl implements BaseUseCase<String, bool> {
  final WeatherRepository _weatherRepository;

  const DeleteFavouriteCityUseCaseImpl(this._weatherRepository);

  @override
  Future<bool> execute({required String input}) =>
      _weatherRepository.deleteFavouriteWeatherByCity(input);
}
