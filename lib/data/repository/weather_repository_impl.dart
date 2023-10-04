import 'package:flutter_weather_app/data/api/weather_api.dart';
import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/mappers/cities_list_entity_mapper.dart';
import 'package:flutter_weather_app/data/mappers/weather_mapper.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatabase database;
  final WeatherApi weatherApi;

  const WeatherRepositoryImpl(this.database, this.weatherApi);

  @override
  Future<CitiesListModel> getFavouriteWeathersList() async =>
      CitiesListEntityMapper.transformCitiesListModelDaoToDomain(
        await database.getAllFavouriteCities(),
      );

  @override
  Future<bool> deleteFavouriteWeatherByCity(String city) async =>
      await database.deleteFavouriteCity(city);

  @override
  Future<bool> addFavouriteCity(String city) async =>
      await database.addFavouriteCity({"city": city});

  @override
  Future<WeatherModel> fetchWeatherByCity(
    bool isCurrentCity,
    String? city,
  ) async =>
      WeatherMapper.transformWeatherModelToDomain(
        await weatherApi.fetchWeatherByCity(isCurrentCity, city),
      );
}
