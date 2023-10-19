import 'package:flutter_weather_app/data/api/weather_api.dart';
import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/mappers/api/suggested_cities_list_mapper.dart';
import 'package:flutter_weather_app/data/mappers/api/weather_mapper.dart';
import 'package:flutter_weather_app/data/mappers/db/cities_list_entity_mapper.dart';
import 'package:flutter_weather_app/data/mappers/db/city_entity_mapper.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatabase database;
  final WeatherApi weatherApi;

  const WeatherRepositoryImpl(this.database, this.weatherApi);

  @override
  Future<CitiesListModel> getFavouriteCitiesList() async =>
      CitiesListEntityMapper.transformCitiesListModelDaoToDomain(
        await database.getAllFavouriteCities(),
      );

  @override
  Future<bool> deleteFavouriteCity(CityModel cityModel) async => await database
      .deleteFavouriteCity(CityEntityMapper.transformToData(cityModel));

  @override
  Future<bool> addFavouriteCity(CityModel cityModel) async => await database
      .addFavouriteCity(CityEntityMapper.transformToData(cityModel));

  @override
  Future<WeatherModel> fetchWeatherByCity(
    bool isCurrentCity,
    String? city,
  ) async =>
      WeatherMapper.transformWeatherModelToDomain(
        await weatherApi.fetchWeatherByCity(isCurrentCity, city),
      );

  @override
  Future<CityModel?> getCityById(String cityId) async {
    final cityModelDao = await database.getCityById(cityId);
    return (cityModelDao == null)
        ? null
        : CityEntityMapper.transformCityModelDaoToDomain(cityModelDao);
  }

  @override
  Future<List<SuggestedCitiesModel>> fetchAutoCompleteSearchData(
      String citySuggestion) async {
    final suggestedCities =
        await weatherApi.fetchAutoCompleteSearchData(citySuggestion);
    return SuggestedCitiesMapper.transformSuggestedCitiesListResponseToDomain(suggestedCities);
  }
}
