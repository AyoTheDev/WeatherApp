import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/view/favorite_cities_screen.dart';
import 'package:flutter_weather_app/presentation/view/home_screen.dart';
import 'package:flutter_weather_app/presentation/view/settings_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  //Current selected screen
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    FavoriteCitiesScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: Strings.home),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: Strings.favorites),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: Strings.settings)
          ],
        ),
        body: _screens[_selectedIndex]);
  }
}
