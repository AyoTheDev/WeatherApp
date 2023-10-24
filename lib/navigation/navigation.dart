import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/navigation/bottom_nav_controller_provider.dart';
import 'package:flutter_weather_app/navigation/weather_nav_screens.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/theme_provider.dart';
import 'package:flutter_weather_app/presentation/view/favorite_cities_screen.dart';
import 'package:flutter_weather_app/presentation/view/home_screen.dart';
import 'package:flutter_weather_app/presentation/view/settings_screen.dart';

class MainNavigator extends ConsumerStatefulWidget {
  const MainNavigator({super.key});

  @override
  ConsumerState<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends ConsumerState<MainNavigator> {
  late WeatherNavScreens _selectedScreen;

  final List<Widget> _screens = const [
    HomeScreen(),
    FavoriteCitiesScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    _selectedScreen = ref.watch(bottomNavControllerProvider);
    final isDarkMode = ref.watch(appThemeProvider);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: dp_0,
          title: Text(
            _selectedScreen.title,
            style: const TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: dp_0,
          currentIndex: _selectedScreen.index,
          items: WeatherNavScreens.values
              .map(
                (screen) => BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    screen.svgPictureActiveIcon,
                  ),
                  icon: SvgPicture.asset(
                    screen.svgPictureIcon,
                  ),
                  label: "",
                ),
              )
              .toList(),
          onTap: (i) {
            setState(() {
              ref
                  .read(bottomNavControllerProvider.notifier)
                  .setSelectedScreen(WeatherNavScreens.values[i]);
            });
          },
        ),
        body: Container(
          decoration: isDarkMode
              ? BoxDecoration(
                  gradient: darkModeBlueGradient,
                )
              : BoxDecoration(
                  gradient: lightModePurpleGradient,
                ),
          child: IndexedStack(
            index: _selectedScreen.index,
            children: _screens,
          ),
        ));
  }
}
