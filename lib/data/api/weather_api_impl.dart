import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/data/api/weather_api.dart';
import 'package:flutter_weather_app/data/exceptions/custom_exception_handler.dart';
import 'package:flutter_weather_app/data/models/response/forecast_model_by_days_response.dart';
import 'package:flutter_weather_app/data/models/response/forecast_model_response_wrapper.dart';
import 'package:flutter_weather_app/data/models/response/suggested_city_model_response.dart';
import 'package:flutter_weather_app/data/models/response/weather_model_response.dart';
import 'package:flutter_weather_app/data/services/services.dart';
import 'package:flutter_weather_app/utils/date_time_utils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

const String baseURL = 'https://api.weatherapi.com/v1/';
const int responseCode200 = 200;

class WeatherApiImpl implements WeatherApi {
  final dio = Dio();

  @override
  Future<Weather> fetchWeatherByCity(bool isCurrent, String? cityName) async {
    try {
      if (isCurrent) {
        Position currentPosition = await LocationService().getCurrentPosition();

        List<Placemark> placeMarks = await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude);

        Placemark place = placeMarks[0];
        cityName = place.locality;
      }

      final response = await dio.get(
        '${baseURL}current.json?q=$cityName&key=${dotenv.env['API_KEY']}',
      );
      if (response.statusCode == responseCode200) {
        return Weather.fromMap(response.data);
      } else {
        throw CustomException(
            '${response.statusCode.toString()} error code with ${response.statusMessage.toString()} message');
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<List<SuggestedCitiesResponse>> fetchAutoCompleteSearchData(
    String citySuggestion,
  ) async {
    try {
      if (citySuggestion == "") return List<SuggestedCitiesResponse>.empty();

      final response = await dio.get(
        "${baseURL}search.json?q=$citySuggestion&key=${dotenv.env['API_KEY']}",
      );

      if (response.statusCode == responseCode200) {
        List<dynamic> list = response.data;
        return list.map((e) => SuggestedCitiesResponse.fromMap(e)).toList();
      } else {
        throw CustomException(
            '${response.statusCode.toString()} error code with ${response.statusMessage.toString()} message');
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<ForecastModelResponseWrapper> fetchForecastData(
    String cityName,
  ) async {
    try {
      final response = await dio.get(
        "${baseURL}forecast.json?q=$cityName&days=4&key=${dotenv.env['API_KEY']}",
      );

      if (response.statusCode == responseCode200) {
        List data = response.data["forecast"]["forecastday"];

        List<ForecastModelByHoursResponse> forecastByHours = [];
        List<ForecastModelByDaysResponse> forecastByDays = [];

        for (Map<String, dynamic> forecastDay in data) {
          forecastByDays.add(ForecastModelByDaysResponse.fromMap(forecastDay));
          for (Map<String, dynamic> forecastHour in forecastDay["hour"]) {
            if (forecastByHours.length == 24) break;
            int timeMillis = forecastHour["time_epoch"] * 1000;
            if (timeMillis >=
                DateTime.now().roundDown().millisecondsSinceEpoch) {
              forecastByHours
                  .add(ForecastModelByHoursResponse.fromMap(forecastHour));
            }
          }
        }
        return ForecastModelResponseWrapper(forecastByHours, forecastByDays);
      } else {
        throw CustomException(
            '${response.statusCode.toString()} error code with ${response.statusMessage.toString()} message');
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
