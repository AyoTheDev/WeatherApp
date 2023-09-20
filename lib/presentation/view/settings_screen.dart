import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text(Strings.settings),
      ),
      backgroundColor: Colors.lightGreen,
    ));

  }
}
