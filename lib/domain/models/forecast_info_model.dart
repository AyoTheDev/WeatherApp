import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_info_model.freezed.dart';

@freezed
class ForecastInfoModel with _$ForecastInfoModel {
  const factory ForecastInfoModel({
    required String icon,
    required String temperature,
  }) = _ForecastInfoModel;
}
