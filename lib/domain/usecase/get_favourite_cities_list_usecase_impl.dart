import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/empty_input.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class GetFavouriteCitiesListUseCaseImpl implements BaseUseCase<EmptyInput, CitiesListModel> {
  final WeatherRepository _weatherRepository;

  const GetFavouriteCitiesListUseCaseImpl(this._weatherRepository);

  @override
  Future<CitiesListModel> execute({required EmptyInput input}) async{
    return await _weatherRepository.getFavouriteCitiesList();
  }
}
