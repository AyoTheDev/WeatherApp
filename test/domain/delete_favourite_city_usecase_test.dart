import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/delete_favourite_city_usecase.dart';
import 'package:mockito/mockito.dart';

import '../mock/domain/repository/weather_repository_mock.mocks.dart';

void main() {
  final WeatherRepository weatherRepository = MockWeatherRepository();
  final BaseUseCase<CityModel, bool> deleteFavouriteCityUseCase =
      DeleteFavouriteCityUseCase(weatherRepository);

  setUp(() {
    when(
      weatherRepository.deleteFavouriteCity(
        const CityModel(
          city: "London",
          country: "UK",
        ),
      ),
    ).thenAnswer((_) async => true);
  });

  test('should return true', () async {
    final actual = await deleteFavouriteCityUseCase.execute(
      input: const CityModel(
        city: "London",
        country: "UK",
      ),
    );
    const expected = true;
    expect(expected, actual);
    verify(
      weatherRepository.deleteFavouriteCity(
        const CityModel(
          city: "London",
          country: "UK",
        ),
      ),
    ).called(1);
  });
}
