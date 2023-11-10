import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/theme_provider.dart';

//TODO: add theme state to shared prefs
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(appThemeProvider);
    return ListView(
      children: [
        ListTile(
          title: Text(
            Strings.changeTheme,
            style: styleOnlyWhiteColor,
          ),
          trailing: Switch(
            onChanged: (value) =>
                ref.read(appThemeProvider.notifier).state = value,
            value: isDarkMode,
          ),
        ),
        const Divider(
          indent: dp_15,
          endIndent: dp_15,
        ),
        ListTile(
          title: Text(Strings.termsAndConditions, style: styleOnlyWhiteColor),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // TODO: Navigate to the Terms & Conditions screen.
          },
        ),
        const Divider(
          indent: dp_15,
          endIndent: dp_15,
        ),
        ListTile(
          title: Text(Strings.aboutUs, style: styleOnlyWhiteColor),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // TODO: Navigate to the About Us screen.
          },
        ),
      ],
    );
  }
}
