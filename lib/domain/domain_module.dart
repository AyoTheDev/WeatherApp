import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/usecase/get_favourite_cities_list_usecase_impl.dart';

import '../data/data_module.dart';
import 'base/base_usecase.dart';

final getWeatherByCityUseCaseProvider = Provider<BaseUseCase>((ref) =>
    GetFavouriteCitiesListUseCaseImpl(ref.watch(weathersRepositoryProvider)));
