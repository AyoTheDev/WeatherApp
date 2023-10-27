import 'package:flutter_weather_app/data/models/response/forecast_model_by_days_response.dart';
import 'package:flutter_weather_app/domain/models/forecast_info_model.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';

class ForecastInfoResponseMapper {
  static ForecastInfoModel transformForecastInfoResponseToDomain(
          ForecastInfo forecastInfo) =>
      ForecastInfoModel(
        icon: "${Strings.https}${forecastInfo.icon}",
        temperature: forecastInfo.temperatureC,
      );
}
