import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/forecast_info_model.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_by_days.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_by_hours.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_forecast_usecase.dart';
import 'package:mockito/mockito.dart';

import '../mock/domain/repository/weather_repository_mock.mocks.dart';

void main() {
  final WeatherRepository weatherRepository = MockWeatherRepository();
  final BaseUseCase<String, ForecastModelWrapper> fetchForecastUseCase =
      FetchForecastUseCase(weatherRepository);

  setUp(() {
    when(weatherRepository.fetchForecastWeatherByCity("London")).thenAnswer(
      (_) async => const ForecastModelWrapper(
        forecastModelByDays: [
          ForecastModelByDays(
            date: "2022-01-01 00:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https:icon_url",
              temperature: 16.1,
            ),
            description: "Partly cloudy",
          ),
          ForecastModelByDays(
            date: "2022-01-01 01:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 17.2,
            ),
            description: "Sunny",
          ),
          ForecastModelByDays(
            date: "2022-01-01 02:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 18.3,
            ),
            description: "Rainy",
          ),
        ],
        forecastModelByHours: [
          ForecastModelByHours(
            hour: "2022-01-01 00:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 19.4,
            ),
          ),
          ForecastModelByHours(
            hour: "2022-01-01 01:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 20.5,
            ),
          ),
          ForecastModelByHours(
            hour: "2022-01-01 02:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 21.6,
            ),
          ),
        ],
      ),
    );
  });

  test('should return ForecastModelWrapper', () async {
    final actual = await fetchForecastUseCase.execute(input: "London");
    const expected = ForecastModelWrapper(
      forecastModelByDays: [
        ForecastModelByDays(
          date: "2022-01-01 00:00",
          forecastInfoModel: ForecastInfoModel(
            icon: "https:icon_url",
            temperature: 16.1,
          ),
          description: "Partly cloudy",
        ),
        ForecastModelByDays(
          date: "2022-01-01 01:00",
          forecastInfoModel: ForecastInfoModel(
            icon: "https://icon_url",
            temperature: 17.2,
          ),
          description: "Sunny",
        ),
        ForecastModelByDays(
          date: "2022-01-01 02:00",
          forecastInfoModel: ForecastInfoModel(
            icon: "https://icon_url",
            temperature: 18.3,
          ),
          description: "Rainy",
        ),
      ],
      forecastModelByHours: [
        ForecastModelByHours(
          hour: "2022-01-01 00:00",
          forecastInfoModel: ForecastInfoModel(
            icon: "https://icon_url",
            temperature: 19.4,
          ),
        ),
        ForecastModelByHours(
          hour: "2022-01-01 01:00",
          forecastInfoModel: ForecastInfoModel(
            icon: "https://icon_url",
            temperature: 20.5,
          ),
        ),
        ForecastModelByHours(
          hour: "2022-01-01 02:00",
          forecastInfoModel: ForecastInfoModel(
            icon: "https://icon_url",
            temperature: 21.6,
          ),
        ),
      ],
    );
    expect(expected, actual);
    verify(weatherRepository.fetchForecastWeatherByCity("London")).called(1);
  });
}
