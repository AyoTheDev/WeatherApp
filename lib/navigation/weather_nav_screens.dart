import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';

enum WeatherNavScreens {
  home(Strings.home, Icons.home),
  favourites(Strings.favorites, Icons.favorite),
  settings(Strings.settings, Icons.settings);

  final String title;
  final IconData icon;

  const WeatherNavScreens(this.title, this.icon);
}
