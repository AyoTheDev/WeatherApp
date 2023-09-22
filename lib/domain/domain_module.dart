import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/usecase/get_weather_by_city_use_case.dart';
import 'package:flutter_weather_app/domain/usecase/get_weather_by_city_usecase_impl.dart';

import '../data/data_module.dart';

final getWeatherByCityUseCaseProvider =
Provider<GetWeatherByCityUseCase>((ref) => GetWeatherByCityUseCaseImpl(ref.watch(weathersRepositoryProvider)));