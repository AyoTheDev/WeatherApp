import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/data/models/response/forecast_model_by_days_response.dart';
import 'package:flutter_weather_app/data/models/response/forecast_model_response_wrapper.dart';
import 'package:flutter_weather_app/data/models/response/suggested_city_model_response.dart';
import 'package:flutter_weather_app/data/models/response/weather_model_response.dart';
import 'package:flutter_weather_app/data/repository/weather_repository_impl.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/forecast_info_model.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_by_days.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_by_hours.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:mockito/mockito.dart';

import '../../mock/data/api/weather_api_mock.mocks.dart';
import '../../mock/data/datasource/database/weather_database_mock.mocks.dart';

void main() {
  final database = MockWeatherDatabase();
  final weatherApi = MockWeatherApi();
  final WeatherRepository weatherRepository =
      WeatherRepositoryImpl(database, weatherApi);

  group('#getAllFavouriteCities', () {
    setUp(() {
      when(database.getAllFavouriteCities()).thenAnswer((_) async => [
            {"city": "Chicago", "country": "USA"},
            {"city": "Zanzibar", "country": "Tanzania"},
            {"city": "Beijing", "country": "China"},
            {"city": "Porto", "country": "Portugal"},
          ]);
    });
    test('should return CitiesListModel', () async {
      final actual = await weatherRepository.getFavouriteCitiesList();
      const expected = CitiesListModel(
        cityModelList: [
          CityModel(city: "Chicago", country: "USA"),
          CityModel(city: "Zanzibar", country: "Tanzania"),
          CityModel(city: "Beijing", country: "China"),
          CityModel(city: "Porto", country: "Portugal"),
        ],
      );
      expect(actual, expected);
      verify(database.getAllFavouriteCities()).called(1);
    });
  });

  group('#addFavouriteCity', () {
    setUp(() {
      when(database.addFavouriteCity(
        {
          'city': "Chicago",
          'country': "USA",
        },
      )).thenAnswer(
        (_) async => true,
      );
    });

    test('should return true', () async {
      await weatherRepository.addFavouriteCity(
        const CityModel(
          city: "Chicago",
          country: "USA",
        ),
      );
      verify(database.addFavouriteCity(
        {
          'city': "Chicago",
          'country': "USA",
        },
      )).called(1);
    });
  });

  group('#deleteFavouriteCity', () {
    setUp(() {
      when(database.deleteFavouriteCity(
        {
          "city": "Chicago",
          "country": "USA",
        },
      )).thenAnswer((_) async => true);
    });

    test('should return true', () async {
      await weatherRepository.deleteFavouriteCity(
        const CityModel(
          city: "Chicago",
          country: "USA",
        ),
      );
      verify(database.deleteFavouriteCity(
        {"city": "Chicago", "country": "USA"},
      )).called(1);
    });
  });

  group('#getCityById', () {
    setUp(() {
      when(database.getCityById(
        "Chicago_USA",
      )).thenAnswer((_) async => {
            "city": "Chicago",
            "country": "USA",
          });
    });

    test('should return CityModel', () async {
      final actual = await weatherRepository.getCityById("Chicago_USA");
      const expected = CityModel(
        city: "Chicago",
        country: "USA",
      );
      expect(actual, expected);
      verify(database.getCityById(
        "Chicago_USA",
      )).called(1);
    });
  });

  group('#fetchWeatherByCity', () {
    setUp(
      () {
        when(weatherApi.fetchWeatherByCity(false, "Beijing")).thenAnswer(
          (_) async => Weather.fromMap(
            {
              "location": {
                "name": "Beijing",
                "country": "China",
              },
              "current": {
                "temp_f": 50.0,
                "temp_c": 10.0,
                "wind_dir": "N",
                "condition": {
                  "text": "cloudy",
                  "icon": "//icon_url",
                }
              },
            },
          ),
        );
      },
    );

    test('should return WeatherModel', () async {
      final actual =
          await weatherRepository.fetchWeatherByCity(false, "Beijing");
      const expected = WeatherModel(
        city: "Beijing",
        country: "China",
        temperatureF: 50.0,
        temperatureC: 10.0,
        description: "cloudy",
        isFavourite: false,
        icon: "https://icon_url",
        windDir: "N",
      );
      expect(actual, expected);
      verify(weatherApi.fetchWeatherByCity(
        false,
        "Beijing",
      )).called(1);
    });
  });

  group('#fetchAutoCompleteSearchData', () {
    setUp(() {
      when(weatherApi.fetchAutoCompleteSearchData("London")).thenAnswer(
        (_) async => [
          SuggestedCitiesResponse.fromMap({
            "name": "London",
            "country": "UK",
          }),
        ],
      );
    });

    test('should return List of SuggestedCitiesModel', () async {
      final actual =
          await weatherRepository.fetchAutoCompleteSearchData("London");
      const expected = [
        SuggestedCitiesModel(citySuggestion: "London", country: "UK"),
      ];
      expect(actual, expected);
      verify(weatherApi.fetchAutoCompleteSearchData(
        "London",
      )).called(1);
    });
  });

  group('#fetchForecastData', () {
    setUp(
      () {
        when(weatherApi.fetchForecastData("London")).thenAnswer(
          (_) async => ForecastModelResponseWrapper(
            [
              ForecastModelByHoursResponse.fromMap(
                {
                  "time": "2022-01-01 00:00",
                  "temp_c": 16.1,
                  "condition": {
                    "icon": "//icon_url",
                  },
                },
              ),
              ForecastModelByHoursResponse.fromMap(
                {
                  "time": "2022-01-01 01:00",
                  "temp_c": 17.2,
                  "condition": {
                    "icon": "//icon_url",
                  },
                },
              ),
              ForecastModelByHoursResponse.fromMap(
                {
                  "time": "2022-01-01 02:00",
                  "temp_c": 18.3,
                  "condition": {
                    "icon": "//icon_url",
                  },
                },
              ),
            ],
            [
              ForecastModelByDaysResponse.fromMap(
                {
                  "date": "2022-01-01 00:00",
                  "day": {
                    "avgtemp_c": 19.4,
                    "condition": {"icon": "//icon_url", "text": "Partly cloudy"},
                  },
                },
              ),
              ForecastModelByDaysResponse.fromMap(
                {
                  "date": "2022-01-01 01:00",
                  "day": {
                    "avgtemp_c": 20.5,
                    "condition": {"icon": "//icon_url", "text": "Sunny"},
                  },
                },
              ),
              ForecastModelByDaysResponse.fromMap(
                {
                  "date": "2022-01-01 02:00",
                  "day": {
                    "avgtemp_c": 21.6,
                    "condition": {"icon": "//icon_url", "text": "Rainy"},
                  },
                },
              ),
            ],
          ),
        );
      },
    );

    test('should return ForecastModelWrapper', () async {
      final actual =
          await weatherRepository.fetchForecastWeatherByCity("London");
      const expected = ForecastModelWrapper(
        forecastModelByDays: [
          ForecastModelByDays(
            date: "2022-01-01 00:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 19.4,
            ),
            description: "Partly cloudy",
          ),
          ForecastModelByDays(
            date: "2022-01-01 01:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 20.5,
            ),
            description: "Sunny",
          ),
          ForecastModelByDays(
            date: "2022-01-01 02:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 21.6,
            ),
            description: "Rainy",
          ),
        ],
        forecastModelByHours: [
          ForecastModelByHours(
            hour: "2022-01-01 00:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 16.1,
            ),
          ),
          ForecastModelByHours(
            hour: "2022-01-01 01:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 17.2,
            ),
          ),
          ForecastModelByHours(
            hour: "2022-01-01 02:00",
            forecastInfoModel: ForecastInfoModel(
              icon: "https://icon_url",
              temperature: 18.3,
            ),
          ),
        ],
      );
      expect(actual, expected);
      verify(weatherApi.fetchForecastData(
        "London",
      )).called(1);
    });
  });
}
