import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          backgroundColor: Colors.transparent,
          elevation: dp_0,
          currentIndex: _selectedScreen.index,
          items: WeatherNavScreens.values
              .map(
                (screen) => BottomNavigationBarItem(
                  icon: Icon(screen.icon),
                  label: screen.title,
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
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      Color.fromRGBO(22, 15, 69, 1),
                      Color.fromRGBO(30, 20, 90, 1),
                      Color.fromRGBO(36, 28, 103, 1),
                      Color.fromRGBO(63, 53, 140, 1),
                      Color.fromRGBO(83, 71, 171, 1),
                      Color.fromRGBO(94, 82, 186, 1),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                )
              : const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      Color.fromRGBO(27, 35, 68, 1),
                      Color.fromRGBO(40, 41, 84, 1),
                      Color.fromRGBO(78, 60, 135, 1),
                      Color.fromRGBO(109, 76, 178, 1),
                      Color.fromRGBO(134, 87, 212, 1),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
          child: IndexedStack(
            index: _selectedScreen.index,
            children: _screens,
          ),
        ));
  }
}
