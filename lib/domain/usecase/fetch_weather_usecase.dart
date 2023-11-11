import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import '../../utils/pair.dart';
import '../models/city_model.dart';
import '../models/weather_model.dart';
import 'fetch_weather_by_city_usecase.dart';

class FetchWeatherUseCase
    implements BaseUseCase<Pair<bool, String?>, WeatherModel> {

  final BaseUseCase<WeatherRequestModel, WeatherModel>
  _fetchWeatherByCityUseCase;

  final BaseUseCase<String, CityModel?> _getCityByIdUseCase;

  const FetchWeatherUseCase(this._fetchWeatherByCityUseCase,
      this._getCityByIdUseCase);

  @override
  Future<WeatherModel> execute({required Pair<bool, String?> input}) async {
    //pair.first -> isCurrent
    //pair.second -> city
    final WeatherModel weather = await _fetchWeatherByCityUseCase.execute(
        input: WeatherRequestModel(input.first, input.second));

    final String cityId = "${weather.city}_${weather.country}";
    final cityModel = await _getCityByIdUseCase.execute(input: cityId);
    final isCityFavorite = weather.country == cityModel?.country &&
        weather.city == cityModel?.city;

    return weather.copyWith(isFavourite: isCityFavorite);

  }
}
