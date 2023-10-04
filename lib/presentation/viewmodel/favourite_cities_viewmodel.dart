import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';

final favouriteCitiesViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<
    FavouriteCitiesViewModel, State<WeatherModel>>(
  (ref) => FavouriteCitiesViewModel(
    ref.watch(addFavouriteWeatherByCityUseCaseProvider),
    ref.watch(deleteFavouriteWeatherByCityUseCaseProvider),
    ref.watch(getFavouriteWeatherByCityUseCaseProvider),
  ),
);

class FavouriteCitiesViewModel {
  final BaseUseCase addFavouriteCityUseCase;
  final BaseUseCase deleteFavouriteCityUseCase;
  final BaseUseCase getFavouriteCitiesListUseCase;

  FavouriteCitiesViewModel(this.addFavouriteCityUseCase,
      this.deleteFavouriteCityUseCase, this.getFavouriteCitiesListUseCase);
}
