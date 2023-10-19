import 'package:flutter_weather_app/data/models/response/suggested_city_model_response.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';

class SuggestedCitiesMapper {
  static SuggestedCitiesModel transformSuggestedCitiesResponseToDomain(
      SuggestedCitiesResponse suggestedCitiesResponse,) =>
      SuggestedCitiesModel(
        citySuggestion: suggestedCitiesResponse.city,
        country: suggestedCitiesResponse.country,
      );

  static List<SuggestedCitiesModel> transformSuggestedCitiesListResponseToDomain(
      List<SuggestedCitiesResponse> list
      ) {
    return list.map((e) => SuggestedCitiesMapper.transformSuggestedCitiesResponseToDomain(e)).toList();
  }
}
