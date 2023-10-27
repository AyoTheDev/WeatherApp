import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_weather_by_city_usecase.dart';

final fetchWeatherProvider = Provider<FetchWeatherProvider>(
  (ref) => FetchWeatherProvider(
    ref.watch(getCityByIdUseCaseProvider),
    ref.watch(fetchWeatherByCityUseCaseProvider),
  ),
);

class FetchWeatherProvider {
  final BaseUseCase<WeatherRequestModel, WeatherModel>
      _fetchWeatherByCityUseCase;
  final BaseUseCase<String, CityModel?> _getCityByIdUseCase;

  const FetchWeatherProvider(
      this._getCityByIdUseCase, this._fetchWeatherByCityUseCase);

  Future<WeatherModel> execute(
    bool isCurrent,
    String? city,
  ) async {
      final WeatherModel weather = await _fetchWeatherByCityUseCase.execute(
          input: WeatherRequestModel(isCurrent, city));

      final String cityId = "${weather.city}_${weather.country}";
      final cityModel = await _getCityByIdUseCase.execute(input: cityId);
      final isCityFavorite = weather.country == cityModel?.country &&
          weather.city == cityModel?.city;
      return weather.copyWith(isFavourite: isCityFavorite);
  }
}
