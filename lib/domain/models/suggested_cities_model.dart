import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggested_cities_model.freezed.dart';

@freezed
class SuggestedCitiesModel with _$SuggestedCitiesModel {
  const factory SuggestedCitiesModel({
    required String citySuggestion,
    required String country,
  }) = _SuggestedCitiesModel;

  const SuggestedCitiesModel._();
}