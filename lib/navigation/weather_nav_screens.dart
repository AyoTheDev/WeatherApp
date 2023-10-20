import 'package:flutter_weather_app/presentation/constants/strings.dart';

enum WeatherNavScreens {
  home(
    Strings.home,
    Strings.homeActiveIconPath,
    Strings.homeInactiveIconPath,
  ),
  favourites(
    Strings.favorites,
    Strings.favouriteActiveIconPath,
    Strings.favouriteInactiveIconPath,
  ),
  settings(
    Strings.settings,
    Strings.settingsActiveIconPath,
    Strings.settingsInactiveIconPath,
  );

  final String title;
  final String svgPictureActiveIcon;
  final String svgPictureIcon;

  const WeatherNavScreens(
      this.title, this.svgPictureActiveIcon, this.svgPictureIcon);
}
