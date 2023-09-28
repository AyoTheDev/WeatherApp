import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_weather_by_city_usecase_impl.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';

final homeViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, State<WeatherModel>>(
  (ref) => HomeViewModel(ref.watch(fetchWeatherByCityUseCaseProvider)),
);

class HomeViewModel extends StateNotifier<State<WeatherModel>> {
  final BaseUseCase fetchWeatherByCityUseCase;

  HomeViewModel(this.fetchWeatherByCityUseCase) : super(const State.init()) {
    fetchWeatherByCity(true, "");
  }

  fetchWeatherByCity(bool isCurrent, String city) async {
    try {
      state = const State.loading();
      final WeatherModel weather = await fetchWeatherByCityUseCase.execute(
          input: WeatherRequestModel(isCurrent, city));
      state = State.success(weather);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
