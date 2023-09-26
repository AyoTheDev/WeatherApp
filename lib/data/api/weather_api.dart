import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/data/models/response/weather_model_response.dart';
import 'package:flutter_weather_app/data/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:dio/dio.dart';

class WeatherApi {
  final dio = Dio();

  Future<FavouriteCitiesWeather?> fetchData(bool current, String? cityName) async {
    try {
      if (current) {
        Position currentPosition = await LocationService().getCurrentPosition();

        List<Placemark> placeMarks = await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude);

        Placemark place = placeMarks[0];
        cityName = place.locality;
      }

      final Response<FavouriteCitiesWeather> response = await dio.get('${dotenv.env['BASE_URL']}current.json?q=$cityName&key=${dotenv.env['API_KEY']}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
          },
        ),);
      if (response.statusCode == 200) {
        final data = response.data;
        print('Received data: $data');
        return data;
      } else {
        // Handle errors here
        // TODO: show user something like loading or refresh button
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // TODO: show user refresh button
      print('Error: $e');
      return null;
    }
  }
}