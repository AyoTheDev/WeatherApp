import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model_wrapper.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_weather_by_city_usecase.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';
import 'package:flutter_weather_app/presentation/viewmodel/favourite_cities_viewmodel.dart';

final homeViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<
    HomeViewModel, State<WeatherModelWrapper>>(
  (ref) => HomeViewModel(
    ref.watch(getCityByIdUseCaseProvider),
    ref.watch(fetchWeatherByCityUseCaseProvider),
    ref.watch(addFavouriteWeatherByCityUseCaseProvider),
    ref.watch(deleteFavouriteWeatherByCityUseCaseProvider),
    ref.read(favouriteCitiesViewModelStateNotifierProvider.notifier),
    ref.watch(fetchAutoCompleteSearchCityUseCaseProvider),
  ),
);

final fetchWeatherNotifierProvider = StateNotifierProvider.autoDispose<
    FetchWeatherNotifierProvider, State<WeatherModelWrapper>>(
  (ref) => FetchWeatherNotifierProvider(
    ref.watch(getCityByIdUseCaseProvider),
    ref.watch(fetchWeatherByCityUseCaseProvider),
  ),
);

class FetchWeatherNotifierProvider
    extends StateNotifier<State<WeatherModelWrapper>> {
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
      state = State.success(
        WeatherModelWrapper(
          weatherModel: weather.copyWith(
            isFavourite: await isCityFavourite(weather),
          ),
        ),
      );
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

class HomeViewModel extends StateNotifier<State<WeatherModelWrapper>> {
  final FavouriteCitiesViewModel _favouriteCitiesViewModel;

  final BaseUseCase<CityModel, bool> _addFavouriteCityUseCase;
  final BaseUseCase<CityModel, bool> _deleteFavouriteCityUseCase;
  final BaseUseCase<WeatherRequestModel, WeatherModel>
      _fetchWeatherByCityUseCase;
  final BaseUseCase<String, CityModel?> _getCityByIdUseCase;
  final BaseUseCase<String, List<SuggestedCitiesModel>>
      _fetchAutoCompleteSearchCityUseCase;

  WeatherModel? weatherModel;

  HomeViewModel(
    this._getCityByIdUseCase,
    this._fetchWeatherByCityUseCase,
    this._addFavouriteCityUseCase,
    this._deleteFavouriteCityUseCase,
    this._favouriteCitiesViewModel,
    this._fetchAutoCompleteSearchCityUseCase,
  ) : super(const State.init()) {
    fetchWeatherByCity(true, "");
  }

  fetchWeatherByCity(bool isCurrent, String? city) async {
    try {
      state = const State.loading();
      final WeatherModel weather = await _fetchWeatherByCityUseCase.execute(
          input: WeatherRequestModel(isCurrent, city));

      final String cityId = "${weather.city}_${weather.country}";
      final cityModel = await _getCityByIdUseCase.execute(input: cityId);
      final isCityFavorite = weather.country == cityModel?.country &&
          weather.city == cityModel?.city;

      weatherModel = weather;

      state = State.success(
        WeatherModelWrapper(
          weatherModel: weather.copyWith(isFavourite: isCityFavorite),
          suggestedCitiesModel: null,
        ),
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  Future<Iterable<SuggestedCitiesModel>> fetchAutocompleteSearchCity(
    String suggestedKeyWord,
  ) => _fetchAutoCompleteSearchCityUseCase.execute(input: suggestedKeyWord);

  addFavouriteCity(WeatherModel weatherModel) async {
    try {
      state = const State.loading();
      final bool favouriteCity = await _addFavouriteCityUseCase.execute(
        input: CityModel.fromWeatherModel(weatherModel),
      );
      state = State.success(
        WeatherModelWrapper(
          weatherModel: weatherModel.copyWith(
            isFavourite: favouriteCity,
          ),
        ),
      );
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
      state = State.success(
        WeatherModelWrapper(
          weatherModel: weatherModel.copyWith(
            isFavourite: !isDeleted,
          ),
        ),
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  void updateCurrentFavouriteState() {
    final data = state.data;
    if (data != null) {
      state = State.success(
        WeatherModelWrapper(
          weatherModel: data.weatherModel.copyWith(isFavourite: false),
        ),
      );
    }
  }

  void getFavouriteCities() {
    _favouriteCitiesViewModel.getFavouriteCitiesFromDB();
  }
}
