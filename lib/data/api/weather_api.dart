import 'package:flutter_weather_app/data/constants/api_key.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/data/models/dao/weather_model.dart';
import 'package:flutter_weather_app/data/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:dio/dio.dart';

class WeatherApi {
  final dio = Dio();

  Future<void> fetchData(bool current, String cityName) async {
    try {
      Position currentPosition = await LocationService().getCurrentPosition();

      if (current) {
        List<Placemark> placeMarks = await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude);

        Placemark place = placeMarks[0];
        cityName = place.locality ?? 'London';
      }

      final response = await dio.get('https://api.weatherapi.com/v1/current.json?q=Yerevan&key=d09502c9205747e2b94110102232109',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiKey.apiKey}',
          },
        ),);
      if (response.statusCode == 200) {
        // Successfully fetched data, parse it here
        final data = response.data;
        print('Received data: $data');
      } else {
        // Handle errors here
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}