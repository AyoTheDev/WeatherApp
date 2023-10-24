import 'package:flutter_weather_app/domain/models/forecast_model_by_days.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_by_hours.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_model_wrapper.freezed.dart';

@freezed
class ForecastModelWrapper with _$ForecastModelWrapper {
  const factory ForecastModelWrapper({
    required List<ForecastModelByDays> forecastModelByDays,
    required List<ForecastModelByHours> forecastModelByHours,
  }) = _ForecastModelWrapper;

  const ForecastModelWrapper._();
}
