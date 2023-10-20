import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/data/exceptions/custom_exception_handler.dart';
import 'package:flutter_weather_app/data/models/response/suggested_city_model_response.dart';
import 'package:flutter_weather_app/data/models/response/weather_model_response.dart';
import 'package:flutter_weather_app/data/services/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

const String baseURL = 'https://api.weatherapi.com/v1/';
const int responseCode200 = 200;

class WeatherApi {
  final dio = Dio();

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
            '${response.statusCode.toString()} error code with ${response
                .statusMessage.toString()} message');
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<SuggestedCitiesResponse>> fetchAutoCompleteSearchData(
      String citySuggestion) async {
    try {
      if(citySuggestion == "") return List<SuggestedCitiesResponse>.empty();

      final response = await dio.get(
        "${baseURL}search.json?q=$citySuggestion&key=${dotenv.env['API_KEY']}",
      );

      if (response.statusCode == responseCode200) {
        List<dynamic> list = response.data;
        return list.map((e) => SuggestedCitiesResponse.fromMap(e)).toList();
      } else {
        throw CustomException(
            '${response.statusCode.toString()} error code with ${response
                .statusMessage.toString()} message');
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
