import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/navigation/weather_nav_screens.dart';

final bottomNavControllerProvider = StateNotifierProvider.autoDispose<
    BottomNavControllerNotifier,
    WeatherNavScreens>((ref) => BottomNavControllerNotifier());

class BottomNavControllerNotifier extends StateNotifier<WeatherNavScreens> {
  BottomNavControllerNotifier() : super(WeatherNavScreens.home);

  void setSelectedScreen(WeatherNavScreens screen) => state = screen;
}
