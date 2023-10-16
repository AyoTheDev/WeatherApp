import 'package:flutter_weather_app/data/models/dao/city_model_dao.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';

class CityEntityMapper {
  static CityModel transformCityModelDaoToDomain(
          final CityModelDao cityModelDao) =>
      CityModel(
        city: cityModelDao["city"],
        country: cityModelDao["country"],
      );

  static CityModelDao transformToData(final CityModel model) => {
        'city': model.city,
        'country': model.country,
      };
}
