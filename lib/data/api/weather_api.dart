import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/data/exceptions/custom_exception_handler.dart';
import 'package:flutter_weather_app/data/models/response/weather_model_response.dart';
import 'package:flutter_weather_app/data/services/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

const String baseURL = 'https://api.weatherapi.com/v1/';

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
        options: Options(
          headers: {
            'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
          },
        ),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        return Weather.fromMap(data);
      } else {
        throw CustomException(
            '${response.statusCode.toString()} error code with ${response.statusMessage.toString()} message');
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
