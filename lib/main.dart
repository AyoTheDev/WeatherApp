import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/presentation/theme_provider.dart';

import 'navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeAnimationDuration: const Duration(milliseconds: 250),
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(
        context,
        ref.watch(appThemeProvider),
      ),
      home: MainNavigator(),
    );
  }
}
