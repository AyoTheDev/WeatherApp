import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    required String city,
    required String country,
  }) = _CityModel;

  static CityModel fromWeatherModel(WeatherModel weatherModel) =>
      CityModel(city: weatherModel.city, country: weatherModel.country);
}

extension CityModelExt on CityModel {
  String get id => "${city}_$country";
}