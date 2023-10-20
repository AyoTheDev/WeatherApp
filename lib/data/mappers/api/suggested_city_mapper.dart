import 'package:flutter_weather_app/data/models/response/suggested_city_model_response.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';

class SuggestedCityMapper {
  static SuggestedCitiesModel transformSuggestedCityModelResponseToDomain(
          final SuggestedCitiesResponse suggestedCityResponseModel) =>
      SuggestedCitiesModel(
        citySuggestion: suggestedCityResponseModel.city,
        country: suggestedCityResponseModel.country,
      );
}