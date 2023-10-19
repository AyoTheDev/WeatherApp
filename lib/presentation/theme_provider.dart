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


ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    colorScheme: isDarkTheme ? darkColorScheme : lightColorScheme,
    useMaterial3: true,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: dp_0,
        selectedItemColor: isDarkTheme ? Colors.white : Colors.white,
        unselectedItemColor: Colors.blueGrey),
    scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
    textTheme: Theme.of(context)
        .textTheme
        .copyWith(
          titleSmall:
              Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11),
        )
        .apply(
          bodyColor: isDarkTheme ? Colors.white : Colors.black,
          displayColor: Colors.grey,
        ),
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.all(isDarkTheme ? Colors.white : Colors.blue),
    ),
    listTileTheme: ListTileThemeData(
        iconColor: isDarkTheme ? Colors.orange : Colors.blueAccent),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54)),
  );
}
