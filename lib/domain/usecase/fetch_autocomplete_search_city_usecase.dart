import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class FetchAutocompleteSearchCityUseCase
    implements BaseUseCase<String, SuggestedCitiesModel> {
  final WeatherRepository _weatherRepository;

  const FetchAutocompleteSearchCityUseCase(this._weatherRepository);

  @override
  Future<SuggestedCitiesModel> execute({required String input}) =>
      _weatherRepository.fetchAutoCompleteSearchData(input);
}
