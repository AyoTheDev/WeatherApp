import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_autocomplete_search_city_usecase.dart';
import 'package:mockito/mockito.dart';

import '../mock/domain/repository/weather_repository_mock.mocks.dart';

void main() {
  final WeatherRepository weatherRepository = MockWeatherRepository();
  final BaseUseCase<String, List<SuggestedCitiesModel>>
      fetchAutoCompleteSearchCityUseCaseProvider =
      FetchAutocompleteSearchCityUseCase(weatherRepository);

  setUp(() {
    when(weatherRepository.fetchAutoCompleteSearchData("London"))
        .thenAnswer((_) async => [
              const SuggestedCitiesModel(
                citySuggestion: "London",
                country: "UK",
              ),
              const SuggestedCitiesModel(
                citySuggestion: "London",
                country: "UK",
              ),
              const SuggestedCitiesModel(
                citySuggestion: "London",
                country: "UK",
              ),
            ]);
  });

  test('should return List of SuggestedCitiesModel', () async {
    final actual = await fetchAutoCompleteSearchCityUseCaseProvider.execute(
        input: "London");
    const expected = [
      SuggestedCitiesModel(
        citySuggestion: "London",
        country: "UK",
      ),
      SuggestedCitiesModel(
        citySuggestion: "London",
        country: "UK",
      ),
      SuggestedCitiesModel(
        citySuggestion: "London",
        country: "UK",
      ),
    ];
    expect(expected, actual);
    verify(weatherRepository.fetchAutoCompleteSearchData("London")).called(1);
  });
}
