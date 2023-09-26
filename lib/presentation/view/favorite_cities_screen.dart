import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';

class FavoriteCitiesScreen extends StatefulWidget {
  const FavoriteCitiesScreen({super.key});

  @override
  State<FavoriteCitiesScreen> createState() => _FavoriteCitiesScreenState();
}

class _FavoriteCitiesScreenState extends State<FavoriteCitiesScreen> {

  //todo: change to the list of cities from api result
  static List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.favorites),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            titleTextStyle: const TextStyle(color: Colors.red, fontSize: listItemFontSize),
            onTap: () {

              //todo: after click get current city weather from APi
            },
          );
        },
      ),
    );
  }
}
