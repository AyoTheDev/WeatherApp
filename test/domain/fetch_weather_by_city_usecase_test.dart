import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_weather_by_city_usecase.dart';
import 'package:mockito/mockito.dart';

import '../mock/domain/repository/weather_repository_mock.mocks.dart';

void main() {
  final WeatherRepository weatherRepository = MockWeatherRepository();
  final BaseUseCase<WeatherRequestModel, WeatherModel>
      fetchWeatherByCityUseCase = FetchWeatherByCityUseCase(weatherRepository);

  setUp(() {
    when(weatherRepository.fetchWeatherByCity(false, "London")).thenAnswer(
      (_) async => const WeatherModel(
        city: "London",
        country: "UK",
        temperatureF: 50.0,
        temperatureC: 10.0,
        description: "Cloudy",
        isFavourite: false,
        icon: "https://icon_url",
        windDir: "N",
      ),
    );
  });

  test('should return WeatherModel', () async {
    final actual = await fetchWeatherByCityUseCase.execute(
        input: const WeatherRequestModel(false, "London"));
    const expected = WeatherModel(
      city: "London",
      country: "UK",
      temperatureF: 50.0,
      temperatureC: 10.0,
      description: "Cloudy",
      isFavourite: false,
      icon: "https://icon_url",
      windDir: "N",
    );
    expect(expected, actual);
    verify(
      weatherRepository.fetchWeatherByCity(
        false,
        "London",
      ),
    ).called(1);
  });
}
