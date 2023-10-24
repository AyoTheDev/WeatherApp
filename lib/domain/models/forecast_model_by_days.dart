import 'package:flutter_weather_app/domain/models/forecast_info_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_model_by_days.freezed.dart';

@freezed
class ForecastModelByDays with _$ForecastModelByDays {
  const factory ForecastModelByDays({
    required String day,
    required ForecastInfoModel forecastInfoModel,
    required String description,
  }) = _ForecastModelByDays;

  const ForecastModelByDays._();
}
