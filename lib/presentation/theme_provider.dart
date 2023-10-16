import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';

final appThemeProvider = StateProvider<bool>((ref) => false);

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: dp_0,
        selectedItemColor: Colors.blueAccent,
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
          MaterialStateProperty.all(isDarkTheme ? Colors.orange : Colors.blue),
    ),
    listTileTheme: ListTileThemeData(
        iconColor: isDarkTheme ? Colors.orange : Colors.purple),
    appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        iconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54)),
  );
}
