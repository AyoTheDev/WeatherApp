import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';
import 'package:flutter_weather_app/domain/models/weather_details_model_wrapper.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';
import 'package:flutter_weather_app/presentation/viewmodel/home_screen_viewmodel.dart';
import 'package:intl/intl.dart';
import '../../utils/pair.dart';

final weatherDetailsViewModelStateNotifierProvider = StateNotifierProvider
    .autoDispose<WeatherDetailsViewModel, State<WeatherDetailsModelWrapper>>(
  (ref) => WeatherDetailsViewModel(
    ref.watch(fetchForecastUseCaseProvider),
    ref.read(homeViewModelStateNotifierProvider.notifier),
    ref.watch(cityNameProvider),
    ref.watch(fetchWeatherUseCaseProvider),
    ref.watch(addFavouriteWeatherByCityUseCaseProvider),
    ref.watch(deleteFavouriteWeatherByCityUseCaseProvider),
  ),
);

final cityNameProvider = StateProvider<String>((ref) => "");

class WeatherDetailsViewModel
    extends StateNotifier<State<WeatherDetailsModelWrapper>> {

  final HomeViewModel _homeViewModel;
  final BaseUseCase<Pair<bool, String?>, WeatherModel>
  _fetchWeatherUseCase;
  final BaseUseCase<String, ForecastModelWrapper>
      _fetchForecastWeatherByCityUseCase;

  final BaseUseCase<CityModel, bool> _addFavouriteCityUseCase;
  final BaseUseCase<CityModel, bool> _deleteFavouriteCityUseCase;

  final String _cityName;

  WeatherDetailsViewModel(
    this._fetchForecastWeatherByCityUseCase,
    this._homeViewModel,
    this._cityName,
    this._fetchWeatherUseCase,
    this._addFavouriteCityUseCase,
    this._deleteFavouriteCityUseCase,
  ) : super(const State.init()) {
    fetchWeatherByCity(_cityName);
  }

  void fetchWeatherByCity(String city) async {
    try {
      state = const State.loading();
      late WeatherModel weatherModel;
      late ForecastModelWrapper forecastModelWrapper;
      final Pair<bool, String?> input = Pair(false, city);
      await Future.wait([
        _fetchWeatherUseCase.execute(input: input)
            .then((value) => weatherModel = value),
        _fetchForecastWeatherByCityUseCase
            .execute(
          input: city, //change
        )
            .then((value) {
          forecastModelWrapper = value;
        })
      ]);

      final modifiedForecastModelByHours =
          forecastModelWrapper.forecastModelByHours.map((e) {
        DateTime dateTime = DateTime.parse(e.date);
        String formattedDate = DateFormat('HH:mm').format(dateTime);
        return e.copyWith(date: formattedDate);
      }).toList();

      final modifiedForecastModelByDays =
          forecastModelWrapper.forecastModelByDays.map((e) {
        DateTime dateTime = DateTime.parse(e.date);
        String formattedDate = DateFormat('EEEE').format(dateTime);
        return e.copyWith(date: formattedDate);
      }).toList();

      state = State.success(
        WeatherDetailsModelWrapper(
          weatherModel: weatherModel,
          forecastModelWrapper: ForecastModelWrapper(
              forecastModelByDays: modifiedForecastModelByDays,
              forecastModelByHours: modifiedForecastModelByHours),
        ),
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addFavouriteCity(WeatherModel weatherModel) async {
    try {
      final bool favouriteCity = await _addFavouriteCityUseCase.execute(
        input: CityModel.fromWeatherModel(weatherModel),
      );
      state = State.success(state.data!.copyWith(
          weatherModel: weatherModel.copyWith(
        isFavourite: favouriteCity,
      )));
      updateCurrentFavouriteState(true);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteFavouriteCity(WeatherModel weatherModel) async {
    try {
      final bool isDeleted = await _deleteFavouriteCityUseCase.execute(
        input: CityModel.fromWeatherModel(weatherModel),
      );
      state = State.success(state.data!.copyWith(
          weatherModel: weatherModel.copyWith(
        isFavourite: !isDeleted,
      )));
      updateCurrentFavouriteState(false);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  void updateCurrentFavouriteState(bool isFavourite) =>
      _homeViewModel.updateCurrentFavouriteState(isFavourite);

  void getFavouriteCities() => _homeViewModel.getFavouriteCities();
}
