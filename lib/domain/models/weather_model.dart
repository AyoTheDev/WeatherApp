import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String city,
    required String temperature,
    required String description,
  }) = _WeatherModel;

  const WeatherModel._();
}