import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model_wrapper.freezed.dart';

@freezed
class WeatherModelWrapper with _$WeatherModelWrapper {
  const factory WeatherModelWrapper({
    required WeatherModel weatherModel,
  }) = _WeatherModelWrapper;

  const WeatherModelWrapper._();
}
