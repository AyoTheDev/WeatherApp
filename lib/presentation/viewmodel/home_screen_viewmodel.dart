import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_weather_by_city_usecase_impl.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';

final homeViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, State<WeatherModel>>(
  (ref) => HomeViewModel(
    ref.watch(fetchWeatherByCityUseCaseProvider),
    ref.watch(addFavouriteWeatherByCityUseCaseProvider),
    ref.watch(deleteFavouriteWeatherByCityUseCaseProvider),
  ),
);

class HomeViewModel extends StateNotifier<State<WeatherModel>> {
  final BaseUseCase<String, bool> _addFavouriteCityUseCase;
  final BaseUseCase<String, bool> _deleteFavouriteCityUseCase;
  final BaseUseCase<WeatherRequestModel, WeatherModel> _fetchWeatherByCityUseCase;

  HomeViewModel(this._fetchWeatherByCityUseCase, this._addFavouriteCityUseCase,
      this._deleteFavouriteCityUseCase)
      : super(const State.init()) {
    fetchWeatherByCity(true, "");
  }

  fetchWeatherByCity(bool isCurrent, String city) async {
    try {
      state = const State.loading();
      final WeatherModel weather = await _fetchWeatherByCityUseCase.execute(
          input: WeatherRequestModel(isCurrent, city));
      state = State.success(weather);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addFavouriteCity(WeatherModel weatherModel) async {
    try {
      state = const State.loading();
      final bool favouriteCity =
          await _addFavouriteCityUseCase.execute(input: weatherModel.city);
      state = State.success(weatherModel.copyWith(isFavourite: favouriteCity));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteFavouriteCity(WeatherModel weatherModel) async {
    try {
      state = const State.loading();
      final bool favouriteCity =
          await _deleteFavouriteCityUseCase.execute(input: weatherModel.city);
      state = State.success(weatherModel.copyWith(isFavourite: favouriteCity));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
