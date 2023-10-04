import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cities_list_model.freezed.dart';

@freezed
class CitiesListModel with _$CitiesListModel {
  const factory CitiesListModel({required List<CityModel> cityModelList}) =
      _CitiesListModel;

  const CitiesListModel._();

  operator [](final int index) => cityModelList[index];

  int get length => cityModelList.length;

  CitiesListModel addCityModel(final CityModel cityModel) =>
      copyWith(cityModelList: [...cityModelList, cityModel]);

  CitiesListModel removeFavouriteCityByCityName(final CityModel cityModel) =>
      copyWith(
          cityModelList: cityModelList.where((city) => city.city != cityModel.city).toList());
}
