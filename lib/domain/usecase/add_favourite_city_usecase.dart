import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class AddFavouriteCityUseCaseImpl implements BaseUseCase<String, bool> {
  final WeatherRepository weatherRepository;

  const AddFavouriteCityUseCaseImpl(this.weatherRepository);

  @override
  Future<bool> execute({required String input}) =>
      weatherRepository.addFavouriteCity(input);
}
