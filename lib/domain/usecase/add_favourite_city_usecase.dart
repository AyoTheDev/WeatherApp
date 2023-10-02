import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class AddFavouriteCityUseCaseImpl implements BaseUseCase<void, String> {
  final WeatherRepository weatherRepository;

  const AddFavouriteCityUseCaseImpl(this.weatherRepository);

  @override
  Future<void> execute({required String input}) =>
      weatherRepository.addFavouriteCity(input);
}
