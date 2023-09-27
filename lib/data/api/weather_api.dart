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

  Future<Weather?> fetchWeatherByCity(bool? current, String? cityName) async {
    try {
      if (current == true) {
        Position currentPosition = await LocationService().getCurrentPosition();

        List<Placemark> placeMarks = await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude);

        Placemark place = placeMarks[0];
        cityName = place.locality;
      }

      final response = await dio.get(
        '$baseURL}current.json?q=$cityName&key=${dotenv.env['API_KEY']}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
          },
        ),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final Map<String, dynamic> decodedJson = json.decode(data);
        print('Received data: $data');
        return Weather.fromMap(decodedJson);
      } else {
        // Handle errors here
        // TODO: show user something like loading or refresh button
        print('Request failed with status: ${response.statusCode}');
        throw CustomException(
            '${response.statusCode.toString()} error code with ${response.statusMessage.toString()} message');
      }
    } catch (e) {
      // TODO: show user refresh button
      print('Error: $e');
      throw CustomException(e.toString());
    }
  }
}
