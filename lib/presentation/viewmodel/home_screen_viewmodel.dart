import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_weather_by_city_usecase_impl.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';
import 'package:flutter_weather_app/presentation/viewmodel/favourite_cities_viewmodel.dart';

final homeViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, State<WeatherModel>>(
  (ref) => HomeViewModel(
      ref.watch(getCityByIdUseCaseProvider),
      ref.watch(fetchWeatherByCityUseCaseProvider),
      ref.watch(addFavouriteWeatherByCityUseCaseProvider),
      ref.watch(deleteFavouriteWeatherByCityUseCaseProvider),
      ref.read(favouriteCitiesViewModelStateNotifierProvider.notifier)),
);

final fetchWeatherNotifierProvider = StateNotifierProvider.autoDispose<
    FetchWeatherNotifierProvider, State<WeatherModel>>(
  (ref) => FetchWeatherNotifierProvider(
    ref.watch(getCityByIdUseCaseProvider),
    ref.watch(fetchWeatherByCityUseCaseProvider),
  ),
);

class FetchWeatherNotifierProvider extends StateNotifier<State<WeatherModel>> {
  final BaseUseCase<WeatherRequestModel, WeatherModel>
      _fetchWeatherByCityUseCase;
  final BaseUseCase<String, CityModel?> _getCityByIdUseCase;

  FetchWeatherNotifierProvider(
    this._getCityByIdUseCase,
    this._fetchWeatherByCityUseCase,
  ) : super(const State.init()) {
    fetchWeatherByCity(true, "");
  }

  fetchWeatherByCity(bool isCurrent, String city) async {
    try {
      state = const State.loading();
      final WeatherModel weather = await _fetchWeatherByCityUseCase.execute(
          input: WeatherRequestModel(isCurrent, city));
      state = State.success(weather.copyWith(
        isFavourite: await isCityFavourite(weather),
      ));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  Future<bool> isCityFavourite(WeatherModel weather) async {
    final String cityId = "${weather.city}_${weather.country}";
    final cityModel = await _getCityByIdUseCase.execute(input: cityId);
    return weather.country == cityModel?.country &&
        weather.city == cityModel?.city;
  }
}

class HomeViewModel extends StateNotifier<State<WeatherModel>> {
  final FavouriteCitiesViewModel _favouriteCitiesViewModel;
  final BaseUseCase<CityModel, bool> _addFavouriteCityUseCase;
  final BaseUseCase<CityModel, bool> _deleteFavouriteCityUseCase;

  final BaseUseCase<WeatherRequestModel, WeatherModel>
      _fetchWeatherByCityUseCase;
  final BaseUseCase<String, CityModel?> _getCityByIdUseCase;

  HomeViewModel(
    this._getCityByIdUseCase,
    this._fetchWeatherByCityUseCase,
    this._addFavouriteCityUseCase,
    this._deleteFavouriteCityUseCase,
    this._favouriteCitiesViewModel,
  ) : super(const State.init()) {
    fetchWeatherByCity(true, "");
  }

  fetchWeatherByCity(bool isCurrent, String city) async {
    try {
      state = const State.loading();
      final WeatherModel weather = await _fetchWeatherByCityUseCase.execute(
          input: WeatherRequestModel(isCurrent, city));
      final String cityId = "${weather.city}_${weather.country}";
      final cityModel = await _getCityByIdUseCase.execute(input: cityId);
      final isCityFavorite = weather.country == cityModel?.country &&
          weather.city == cityModel?.city;
      state = State.success(weather.copyWith(isFavourite: isCityFavorite));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addFavouriteCity(WeatherModel weatherModel) async {
    try {
      state = const State.loading();
      final bool favouriteCity = await _addFavouriteCityUseCase.execute(
        input: CityModel.fromWeatherModel(weatherModel),
      );
      state = State.success(weatherModel.copyWith(isFavourite: favouriteCity));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteFavouriteCity(WeatherModel weatherModel) async {
    try {
      state = const State.loading();
      final bool isDeleted = await _deleteFavouriteCityUseCase.execute(
        input: CityModel.fromWeatherModel(weatherModel),
      );
      state = State.success(weatherModel.copyWith(isFavourite: !isDeleted));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  void updateCurrentFavouriteState() {
    final data = state.data;
    if(data != null) {
      state = State.success(data.copyWith(isFavourite: false));
    }
  }

  void getFavouriteCities() {
    _favouriteCitiesViewModel.getFavouriteCitiesFromDB();
  }
}
