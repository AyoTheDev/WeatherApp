import 'package:flutter_weather_app/data/mappers/api/forecast_model_by_days_mapper.dart';
import 'package:flutter_weather_app/data/mappers/api/forecast_model_by_hours_mapper.dart';
import 'package:flutter_weather_app/data/models/response/forecast_model_response_wrapper.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_wrapper.dart';

class ForecastModelResponseWrapperMapper {
  static ForecastModelWrapper transformForecastModelResponseWrapperToDomain(
          ForecastModelResponseWrapper response) =>
      ForecastModelWrapper(
        forecastModelByDays: response.forecastModelByDaysResponse
            .map((e) => ForecastModelByDaysMapper
                .transformForecastModelByDaysResponseToDomain(e))
            .toList(),
        forecastModelByHours: response.forecastModelByHoursResponse
            .map((e) => ForecastModelByHoursMapper
                .transformForecastModelByHoursResponseToDomain(e))
            .toList(),
      );
}
