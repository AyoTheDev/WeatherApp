import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/usecase/delete_favourite_city_usecase_impl.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_weather_by_city_usecase_impl.dart';
import 'package:flutter_weather_app/domain/usecase/get_favourite_cities_list_usecase_impl.dart';

import '../data/data_module.dart';
import 'base/base_usecase.dart';

final fetchWeatherByCityUseCaseProvider = Provider<BaseUseCase>((ref) =>
    FetchWeatherByCityUseCaseImpl(ref.watch(weathersRepositoryProvider)));

final getFavouriteWeatherByCityUseCaseProvider = Provider<BaseUseCase>((ref) =>
    GetFavouriteCitiesListUseCaseImpl(ref.watch(weathersRepositoryProvider)));

final deleteFavouriteWeatherByCityUseCaseProvider = Provider<BaseUseCase>((ref) =>
    DeleteFavouriteCityUseCaseImpl(ref.watch(weathersRepositoryProvider)));