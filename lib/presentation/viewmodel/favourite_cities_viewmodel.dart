import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/empty_input.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';

final favouriteCitiesViewModelStateNotifierProvider = StateNotifierProvider
    .autoDispose<FavouriteCitiesViewModel, State<CitiesListModel>>(
  (ref) => FavouriteCitiesViewModel(
    ref.watch(deleteFavouriteWeatherByCityUseCaseProvider),
    ref.watch(getFavouriteWeatherByCityUseCaseProvider),
  ),
);

class FavouriteCitiesViewModel extends StateNotifier<State<CitiesListModel>> {
  final BaseUseCase<CityModel, bool> _deleteFavouriteCityUseCase;
  final BaseUseCase<EmptyInput, CitiesListModel> _getFavouriteCitiesListUseCase;

  FavouriteCitiesViewModel(
    this._deleteFavouriteCityUseCase,
    this._getFavouriteCitiesListUseCase,
  ) : super(const State.init()) {
    loadFavouriteCities();
  }

  loadFavouriteCities() async {
    try {
      state = const State.loading();
      final favouriteCitiesList = await _getFavouriteCitiesListUseCase.execute(
          input: const EmptyInput());
      state = State.success(favouriteCitiesList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteFavouriteCity(CityModel cityModel) async {
    try {
      final currentData =
          state.data ?? const CitiesListModel(cityModelList: []);
      final currentList = currentData.cityModelList.toList();
      state = const State.loading();
      final bool isDeleted =
          await _deleteFavouriteCityUseCase.execute(input: cityModel);
      if (!isDeleted) {
        state = State.success(currentData);
        return;
      }
      int index = -1;
      for (int i = 0; i < currentList.length; i++) {
        if (currentList[i].id == cityModel.id) {
          index = i;
          break;
        }
      }
      if (index >= 0) currentList.removeAt(index);

      state = State.success(currentData.copyWith(cityModelList: currentList));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
