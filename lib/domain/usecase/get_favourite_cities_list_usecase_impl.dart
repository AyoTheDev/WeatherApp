import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class GetFavouriteCitiesListUseCaseImpl implements BaseUseCase<WeatherModel, Object?> {
  final WeatherRepository _weatherRepository;

  const GetFavouriteCitiesListUseCaseImpl(this._weatherRepository);

  @override
  Future<WeatherModel> execute({Object? params}) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
