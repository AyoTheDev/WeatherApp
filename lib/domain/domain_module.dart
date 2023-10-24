import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/data/data_module.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/empty_input.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/usecase/add_favourite_city_usecase.dart';
import 'package:flutter_weather_app/domain/usecase/delete_favourite_city_usecase.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_autocomplete_search_city_usecase.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_forecast_usecase.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_weather_by_city_usecase.dart';
import 'package:flutter_weather_app/domain/usecase/get_city_by_id_usecase.dart';
import 'package:flutter_weather_app/domain/usecase/get_favourite_cities_list_usecase.dart';

final fetchWeatherByCityUseCaseProvider =
    Provider<BaseUseCase<WeatherRequestModel, WeatherModel>>(
        (ref) => FetchWeatherByCityUseCase(
              ref.watch(weathersRepositoryProvider),
            ));

final getFavouriteWeatherByCityUseCaseProvider =
    Provider<BaseUseCase<EmptyInput, CitiesListModel>>(
        (ref) => GetFavouriteCitiesListUseCase(
              ref.watch(weathersRepositoryProvider),
            ));

final deleteFavouriteWeatherByCityUseCaseProvider =
    Provider<BaseUseCase<CityModel, bool>>((ref) => DeleteFavouriteCityUseCase(
          ref.watch(weathersRepositoryProvider),
        ));

final addFavouriteWeatherByCityUseCaseProvider =
    Provider<BaseUseCase<CityModel, bool>>((ref) => AddFavouriteCityUseCase(
          ref.watch(weathersRepositoryProvider),
        ));

final getCityByIdUseCaseProvider =
    Provider<BaseUseCase<String, CityModel?>>((ref) => GetCityByIdUseCase(
          ref.watch(weathersRepositoryProvider),
        ));

final fetchAutoCompleteSearchCityUseCaseProvider =
    Provider<BaseUseCase<String, List<SuggestedCitiesModel>>>(
        (ref) => FetchAutocompleteSearchCityUseCase(
              ref.watch(weathersRepositoryProvider),
            ));

final fetchForecastUseCaseProvider =
    Provider<BaseUseCase<String, ForecastModelWrapper>>(
        (ref) => FetchForecastUseCase(
              ref.watch(weathersRepositoryProvider),
            ));
