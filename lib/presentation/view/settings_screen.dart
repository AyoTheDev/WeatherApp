import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/theme_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(appThemeProvider);
    return ListView(
      children: <Widget>[
        ListTile(
          title: const Text(Strings.changeTheme),
          trailing: Switch(
            activeColor: Colors.orange,
            onChanged: (value) {
              ref.read(appThemeProvider.notifier).state = value;
            },
            value: isDarkMode,
          ),
        ),
        const Divider(), // Add a divider between items
        ListTile(
          title: const Text(Strings.termsAndConditions),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // TODO: Navigate to the Terms & Conditions screen.
          },
        ),
        const Divider(),
        ListTile(
          title: const Text(Strings.aboutUs),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // TODO: Navigate to the About Us screen.
          },
        ),
      ],
    );
  }
}
