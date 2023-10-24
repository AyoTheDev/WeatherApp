import 'package:flutter_weather_app/data/mappers/api/forecast_info_response_mapper.dart';
import 'package:flutter_weather_app/data/models/response/forecast_model_by_days_response.dart';
import 'package:flutter_weather_app/domain/models/forecast_model_by_days.dart';

class ForecastModelByDaysMapper {
  static ForecastModelByDays transformForecastModelByDaysResponseToDomain(
          ForecastModelByDaysResponse responseByDays) =>
      ForecastModelByDays(
        day: responseByDays.days,
        forecastInfoModel:
            ForecastInfoResponseMapper.transformForecastInfoResponseToDomain(
          responseByDays.forecastInfo,
        ),
        description: responseByDays.description,
      );
}
