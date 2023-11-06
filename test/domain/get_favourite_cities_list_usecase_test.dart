import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/empty_input.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/get_favourite_cities_list_usecase.dart';
import 'package:mockito/mockito.dart';

import '../mock/domain/repository/weather_repository_mock.mocks.dart';

void main() {
  final WeatherRepository weatherRepository = MockWeatherRepository();
  final BaseUseCase<EmptyInput, CitiesListModel> getFavouriteCitiesListUseCase =
      GetFavouriteCitiesListUseCase(weatherRepository);

  setUp(() {
    when(
      weatherRepository.getFavouriteCitiesList(),
    ).thenAnswer(
      (_) async => const CitiesListModel(cityModelList: [
        CityModel(city: "Zanzibar", country: "Tanzania"),
        CityModel(city: "Beijing", country: "China"),
        CityModel(city: "Porto", country: "Portugal"),
        CityModel(city: "Chicago", country: "USA"),
      ]),
    );
  });

  test('should return CitiesListModel', () async {
    final actual = await getFavouriteCitiesListUseCase.execute(input: const EmptyInput());
    const expected = CitiesListModel(cityModelList: [
      CityModel(city: "Zanzibar", country: "Tanzania"),
      CityModel(city: "Beijing", country: "China"),
      CityModel(city: "Porto", country: "Portugal"),
      CityModel(city: "Chicago", country: "USA"),
    ]);
    expect(expected, actual);
    verify(
      weatherRepository.getFavouriteCitiesList(),
    ).called(1);
  });
}
