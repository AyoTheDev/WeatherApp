import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model_wrapper.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';
import 'package:flutter_weather_app/presentation/viewmodel/favourite_cities_viewmodel.dart';
import 'package:flutter_weather_app/presentation/viewmodel/fetch_weather_provider.dart';

final homeViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<
    HomeViewModel, State<WeatherModelWrapper>>(
  (ref) => HomeViewModel(
    ref.watch(addFavouriteWeatherByCityUseCaseProvider),
    ref.watch(deleteFavouriteWeatherByCityUseCaseProvider),
    ref.read(favouriteCitiesViewModelStateNotifierProvider.notifier),
    ref.watch(fetchAutoCompleteSearchCityUseCaseProvider),
    ref.watch(fetchWeatherProvider),
  ),
);

class HomeViewModel extends StateNotifier<State<WeatherModelWrapper>> {
  final FavouriteCitiesViewModel _favouriteCitiesViewModel;
  final FetchWeatherProvider _fetchWeatherProvider;

  final BaseUseCase<CityModel, bool> _addFavouriteCityUseCase;
  final BaseUseCase<CityModel, bool> _deleteFavouriteCityUseCase;
  final BaseUseCase<String, List<SuggestedCitiesModel>>
      _fetchAutoCompleteSearchCityUseCase;

  HomeViewModel(
    this._addFavouriteCityUseCase,
    this._deleteFavouriteCityUseCase,
    this._favouriteCitiesViewModel,
    this._fetchAutoCompleteSearchCityUseCase,
    this._fetchWeatherProvider,
  ) : super(const State.init()) {
    fetchWeatherByCity(true, "");
  }

  fetchWeatherByCity(bool isCurrent, String? city) async {
    try {
      state = const State.loading();
      final result = await _fetchWeatherProvider.execute(isCurrent, city);
      state = State.success(
        WeatherModelWrapper(weatherModel: result),
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  Future<Iterable<SuggestedCitiesModel>> fetchAutocompleteSearchCity(
    String suggestedKeyWord,
  ) =>
      _fetchAutoCompleteSearchCityUseCase.execute(input: suggestedKeyWord);

  addFavouriteCity(WeatherModel weatherModel) async {
    try {
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

  void updateCurrentFavouriteState(bool isFavourite) {
    final data = state.data;
    if (data == null) return;
    state = State.success(
      WeatherModelWrapper(
        weatherModel: data.weatherModel.copyWith(isFavourite: isFavourite),
      ),
    );
  }

  void getFavouriteCities() {
    _favouriteCitiesViewModel.loadFavouriteCities();
  }
}
