import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/navigation/bottom_nav_controller_provider.dart';
import 'package:flutter_weather_app/navigation/weather_nav_screens.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/viewmodel/favourite_cities_viewmodel.dart';
import 'package:flutter_weather_app/presentation/viewmodel/home_screen_viewmodel.dart';

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

  @override
  void initState() {
    super.initState();
    setState(() {
      _viewModel = ref.read(_favouriteCitiesViewModelProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var data = ref.watch(_favouriteCitiesViewModelProvider).data;
        return ref.watch(_favouriteCitiesViewModelProvider).maybeWhen(
            success: (content) => data?.length != 0
                ? _buildSuccessWidget(data!)
                : const Center(
                    child: Text(
                    Strings.thereIsNoFavouriteCity,
                    style: TextStyle(fontSize: dp_20),
                  )),
            error: (_) => _buildErrorWidget(),
            loading: () => const CircularProgressIndicator(),
            orElse: () => const Center(
                    child: Text(
                  Strings.thereIsNoFavouriteCity,
                  style: TextStyle(fontSize: dp_20),
                )));
      },
    );
  }

  Widget _buildSuccessWidget(CitiesListModel citiesListModel) {
    return ListView.separated(
      itemCount: citiesListModel.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              Text(citiesListModel.cityModelList[index].city),
              const Spacer(),
              IconButton(
                onPressed: () {
                  _viewModel.deleteFavouriteCity(citiesListModel[index]);
                  ref
                      .read(homeViewModelStateNotifierProvider.notifier)
                      .updateCurrentFavouriteState();
                },
                padding: const EdgeInsets.all(dp_0),
                icon: const Icon(Icons.favorite),
                color: Colors.red,
                iconSize: dp_30,
              ),
            ],
          ),
          onTap: () {
            fetchSelectedCityWeather(citiesListModel.cityModelList[index].city);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          indent: 15,
          endIndent: 15,
        );
      },
    );
  }

  void fetchSelectedCityWeather(String city) {
    ref
        .read(
          bottomNavControllerProvider.notifier,
        )
        .setSelectedScreen(
          WeatherNavScreens.home,
        );
    ref
        .read(
          homeViewModelStateNotifierProvider.notifier,
        )
        .fetchWeatherByCity(
          false,
          city,
        );
  }

  Widget _buildErrorWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          Strings.somethingWentWrong,
          style: TextStyle(
            fontSize: dp_24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: dp_20), // Spacer between text and button
        ElevatedButton(
          onPressed: () {
            _viewModel.getFavouriteCitiesFromDB();
          },
          child: const Text(Strings.refresh),
        ),
      ],
    ));
  }
}
