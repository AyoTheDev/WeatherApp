import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/presentation/viewmodel/favourite_cities_viewmodel.dart';

class FavoriteCitiesScreen extends ConsumerStatefulWidget {
  const FavoriteCitiesScreen({super.key});

  @override
  ConsumerState<FavoriteCitiesScreen> createState() =>
      _FavoriteCitiesScreenState();
}

class _FavoriteCitiesScreenState extends ConsumerState<FavoriteCitiesScreen> {
  final _favouriteCitiesViewModelProvider =
      favouriteCitiesViewModelStateNotifierProvider;
  late FavouriteCitiesViewModel _viewModel;
  bool _isFavourite = false;

  //todo: change to the list of cities from api result
  static List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _viewModel = ref.watch(_favouriteCitiesViewModelProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              onPressed: () {
                _toggleFavourite();
              },
              padding: const EdgeInsets.all(0),
              icon: (_isFavourite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border)),
              color: Colors.red,
              iconSize: 30,
            ),
            onTap: () {
              //todo: after click get current city weather from APi
            },
          );
        },
      ),
    );
  }

  void _toggleFavourite() {
    setState(() {
      _isFavourite ? _isFavourite = false : _isFavourite = true;
    });
  }
}
