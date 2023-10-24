import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_details_model_wrapper.freezed.dart';

@freezed
class WeatherDetailsModelWrapper with _$WeatherDetailsModelWrapper {
  const factory WeatherDetailsModelWrapper({
    required WeatherModel weatherModel,
    required ForecastModelWrapper forecastModelWrapper,
  }) = _WeatherDetailsModelWrapper;

  const WeatherDetailsModelWrapper._();
}
