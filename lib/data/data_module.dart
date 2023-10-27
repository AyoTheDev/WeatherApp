import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/data/api/weather_api_impl.dart';
import 'package:flutter_weather_app/data/datasource/database/weather_database.dart';
import 'package:flutter_weather_app/data/repository/weather_repository_impl.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';

import 'datasource/database/weather_database_impl.dart';

final weathersDatabaseProvider = Provider<WeatherDatabase>((_) => WeatherDatabaseImpl());

final weathersApiProvider = Provider<WeatherApiImpl>((_) => WeatherApiImpl());

final weathersRepositoryProvider = Provider<WeatherRepository>((ref) =>
    WeatherRepositoryImpl(
        ref.watch(weathersDatabaseProvider), ref.watch(weathersApiProvider)));
