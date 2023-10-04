import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/domain_module.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/domain/models/empty_input.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';

final favouriteCitiesViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<
    FavouriteCitiesViewModel, State<CitiesListModel>>(
  (ref) => FavouriteCitiesViewModel(
    ref.watch(addFavouriteWeatherByCityUseCaseProvider),
    ref.watch(deleteFavouriteWeatherByCityUseCaseProvider),
    ref.watch(getFavouriteWeatherByCityUseCaseProvider),
  ),
);

class FavouriteCitiesViewModel extends StateNotifier<State<CitiesListModel>>  {
  final BaseUseCase<String, bool> _addFavouriteCityUseCase;
  final BaseUseCase<String, bool> _deleteFavouriteCityUseCase;
  final BaseUseCase<EmptyInput, CitiesListModel> _getFavouriteCitiesListUseCase;

  FavouriteCitiesViewModel(this._addFavouriteCityUseCase,
      this._deleteFavouriteCityUseCase, this._getFavouriteCitiesListUseCase)
      : super(const State.init());

  getFavouriteCitiesFromDB() async {
    try {
      state = const State.loading();
      final favouriteCitiesList = await _getFavouriteCitiesListUseCase.execute(input: const EmptyInput());
      state = State.success(favouriteCitiesList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
