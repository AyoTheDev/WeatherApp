import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/empty_input.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class GetFavouriteCitiesListUseCaseImpl implements BaseUseCase<WeatherModel, EmptyInput> {
  final WeatherRepository _weatherRepository;

  const GetFavouriteCitiesListUseCaseImpl(this._weatherRepository);

  @override
  Future<WeatherModel> execute({required EmptyInput input}) async{
    return const WeatherModel(city: '', temperatureF: 0, temperatureC: 0, description: '');
    // TODO: create logic
  }
}
