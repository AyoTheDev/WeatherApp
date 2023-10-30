import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';
import 'package:flutter_weather_app/domain/models/weather_details_model_wrapper.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';
import 'package:flutter_weather_app/presentation/viewmodel/fetch_weather_provider.dart';
import 'package:flutter_weather_app/presentation/viewmodel/home_screen_viewmodel.dart';

final weatherDetailsViewModelStateNotifierProvider = StateNotifierProvider
    .autoDispose<WeatherDetailsViewModel, State<WeatherDetailsModelWrapper>>(
  (ref) => WeatherDetailsViewModel(
    ref.watch(fetchForecastUseCaseProvider),
    ref.read(homeViewModelStateNotifierProvider.notifier),
    ref.watch(cityNameProvider),
    ref.watch(fetchWeatherProvider),
  ),
);

final cityNameProvider = StateProvider<String>((ref) => "");

class WeatherDetailsViewModel
    extends StateNotifier<State<WeatherDetailsModelWrapper>> {
  final FetchWeatherProvider _fetchWeatherProvider;
  final HomeViewModel _homeViewModel;
  final BaseUseCase<String, ForecastModelWrapper>
      _fetchForecastWeatherByCityUseCase;

  final String _cityName;

  WeatherDetailsViewModel(
    this._fetchForecastWeatherByCityUseCase,
    this._homeViewModel,
    this._cityName,
    this._fetchWeatherProvider,
  ) : super(const State.init()) {
    fetchWeatherByCity(_cityName);
  }

  void fetchWeatherByCity(String city) async {
    try {
      state = const State.loading();
      late WeatherModel weatherModel;
      late ForecastModelWrapper forecastModelWrapper;
      await Future.wait([
        _fetchWeatherProvider
            .execute(
              false,
              city,
            )
            .then((value) => weatherModel = value),
        _fetchForecastWeatherByCityUseCase
            .execute(
          input: city, //change
        )
            .then((value) {
          forecastModelWrapper = value;
        })
      ]);

      final modifiedForecastModelByHours = forecastModelWrapper.forecastModelByHours.map((e) {
        DateTime dateTime = DateTime.parse(e.hour);
        int hour = dateTime.hour;
        int second = dateTime.second;
        return e.copyWith(hour: "$hour:$second");
      }).toList();

      final modifiedForecastModelByDays = forecastModelWrapper.forecastModelByDays.map((e) {
        DateTime dateTime = DateTime.parse(e.date);
        int day = dateTime.day;
        return e.copyWith(date: day.toString());
      }).toList();
      state = State.success(
        WeatherDetailsModelWrapper(
          weatherModel: weatherModel,
          forecastModelWrapper: ForecastModelWrapper(forecastModelByDays: modifiedForecastModelByDays, forecastModelByHours: modifiedForecastModelByHours),
        ),
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addFavouriteCity(WeatherModel weatherModel) async =>
      await _homeViewModel.addFavouriteCity(weatherModel);

  deleteFavouriteCity(WeatherModel weatherModel) async =>
      await _homeViewModel.deleteFavouriteCity(weatherModel);

  void updateCurrentFavouriteState() {
    _homeViewModel.updateCurrentFavouriteState();
  }

  void getFavouriteCities() => _homeViewModel.getFavouriteCities();
}
