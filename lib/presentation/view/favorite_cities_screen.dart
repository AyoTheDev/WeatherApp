import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/models/cities_list_model.dart';
import 'package:flutter_weather_app/navigation/bottom_nav_controller_provider.dart';
import 'package:flutter_weather_app/navigation/weather_nav_screens.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/viewmodel/favourite_cities_viewmodel.dart';
import 'package:flutter_weather_app/presentation/viewmodel/home_screen_viewmodel.dart';

class FavoriteCitiesScreen extends ConsumerWidget {
  FavoriteCitiesScreen({super.key});

  final _favouriteCitiesViewModelProvider =
      favouriteCitiesViewModelStateNotifierProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(_favouriteCitiesViewModelProvider).maybeWhen(
            success: (data) => _buildSuccessWidget(data, ref),
            error: (_) => _buildErrorWidget(ref),
            loading: () => _buildLoadingWidget(),
            orElse: () => _buildDefaultWidget(),
          );

  Widget _buildLoadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _buildDefaultWidget() => const Center(
        child: Text(
          Strings.thereIsNoFavouriteCity,
          style: TextStyle(fontSize: dp_20),
        ),
      );

  Widget _buildSuccessWidget(CitiesListModel citiesListModel, WidgetRef ref) {
    final viewModel = ref.read(_favouriteCitiesViewModelProvider.notifier);

    if (citiesListModel.length == 0) {
      return const Center(
        child: Text(
          Strings.thereIsNoFavouriteCity,
          style: TextStyle(fontSize: dp_20),
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(_favouriteCitiesViewModelProvider),
      child: ListView.separated(
        itemCount: citiesListModel.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Text(citiesListModel.cityModelList[index].city,
                    style: styleOnlyWhiteColor),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    viewModel.deleteFavouriteCity(citiesListModel[index]);
                    ref
                        .read(homeViewModelStateNotifierProvider.notifier)
                        .updateCurrentFavouriteState(false);
                  },
                  padding: const EdgeInsets.all(dp_0),
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: dp_30,
                ),
              ],
            ),
            onTap: () {
              fetchSelectedCityWeather(
                  citiesListModel.cityModelList[index].city, ref);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.white,
            indent: dp_15,
            endIndent: dp_15,
          );
        },
      ),
    );
  }

  void fetchSelectedCityWeather(String city, WidgetRef ref) {
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

  Widget _buildErrorWidget(WidgetRef ref) {
    final viewModel = ref.read(_favouriteCitiesViewModelProvider.notifier);
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
            viewModel.loadFavouriteCities();
          },
          child: const Text(Strings.refresh),
        ),
      ],
    ));
  }
}
