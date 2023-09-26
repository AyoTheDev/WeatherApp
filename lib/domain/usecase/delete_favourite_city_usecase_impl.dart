import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class DeleteFavouriteCityUseCaseImpl implements BaseUseCase<Object?, String> {
  final WeatherRepository _weatherRepository;

  const DeleteFavouriteCityUseCaseImpl(this._weatherRepository);

  @override
  Future<Object?> execute({String? params}) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
