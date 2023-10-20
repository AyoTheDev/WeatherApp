import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';

final appThemeProvider = StateProvider<bool>((ref) => false);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Colors.orange,
  onPrimary: Colors.orange,
  secondary: Colors.orange,
  onSecondary: Colors.yellow,
  error: Colors.red,
  onError: Colors.red,
  background: Colors.black,
  onBackground: Colors.white,
  surface: Colors.black,
  onSurface: Colors.white,
);
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.blueAccent,
  onPrimary: Colors.blueAccent,
  secondary: Colors.blueAccent,
  onSecondary: Colors.yellow,
  error: Colors.red,
  onError: Colors.red,
  background: Colors.white,
  onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
);


ThemeData getAppTheme(BuildContext context, bool isDarkMode) {
  return ThemeData(
    colorScheme: isDarkMode ? darkColorScheme : lightColorScheme,
    useMaterial3: true,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDarkMode ? const Color.fromRGBO(68, 58, 135, 1) : const Color.fromRGBO(101, 65, 158, 1),
        elevation: dp_0,
        selectedItemColor: isDarkMode ? Colors.white : Colors.white,
        unselectedItemColor: Colors.blueGrey),
    scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
    textTheme: Theme.of(context)
        .textTheme
        .copyWith(
          titleSmall:
              Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11),
        )
        .apply(
          bodyColor: isDarkMode ? Colors.white : Colors.black,
          displayColor: Colors.grey,
        ),
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.all(isDarkMode ? Colors.white : Colors.blue),
    ),
    listTileTheme: ListTileThemeData(
        iconColor: isDarkMode ? Colors.orange : Colors.blueAccent),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme:
            IconThemeData(color: isDarkMode ? Colors.white : Colors.black54)),
  );
}
