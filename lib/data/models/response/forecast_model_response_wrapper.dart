import 'package:flutter_weather_app/data/models/response/forecast_model_by_days_response.dart';

class ForecastModelResponseWrapper {
  final List<ForecastModelByHoursResponse> forecastModelByHoursResponse;
  final List<ForecastModelByDaysResponse> forecastModelByDaysResponse;

  const ForecastModelResponseWrapper(
    this.forecastModelByHoursResponse,
    this.forecastModelByDaysResponse,
  );
}
