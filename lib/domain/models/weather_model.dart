import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String city,
    required String country,
    required double temperatureF,
    required double temperatureC,
    required String description,
    required bool isFavourite,
  }) = _WeatherModel;

  const WeatherModel._();
}
