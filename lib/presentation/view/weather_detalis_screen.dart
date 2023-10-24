import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/models/weather_model_wrapper.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/theme_provider.dart';
import 'package:flutter_weather_app/presentation/viewmodel/home_screen_viewmodel.dart';

class WeatherDetailsScreen extends ConsumerStatefulWidget {
  final String cityName;

  const WeatherDetailsScreen({required this.cityName, super.key});

  @override
  ConsumerState<WeatherDetailsScreen> createState() =>
      _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends ConsumerState<WeatherDetailsScreen> {
  final _homeViewModelProvider = homeViewModelStateNotifierProvider;
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    setState(() {
      _viewModel = ref.read(_homeViewModelProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(appThemeProvider);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: dp_0,
          iconTheme: const IconThemeData(color: Colors.blueAccent),
          title: const Text(Strings.details,
              style: TextStyle(color: Colors.blueAccent)),
        ),
        body: Container(
          decoration: isDarkMode
              ? BoxDecoration(
                  gradient: darkModeBlueGradient,
                )
              : BoxDecoration(
                  gradient: lightModePurpleGradient,
                ),
          child: buildConsumer(),
        ));
  }

  Widget buildConsumer() {
    return Consumer(
      builder: (context, ref, _) {
        var data = ref.watch(_homeViewModelProvider).data;
        return ref.watch(_homeViewModelProvider).maybeWhen(
              loading: () => _buildLoadingWidget(),
              success: (content) => _buildSuccessWidget(data!),
              error: (_) => _buildErrorWidget(),
              orElse: () => _buildLoadingWidget(),
            );
      },
    );
  }

  Widget _buildLoadingWidget() =>
      const Center(child: CircularProgressIndicator());

  Widget _buildSuccessWidget(WeatherModelWrapper weatherModelWrapper) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: dp_20, right: dp_20, top: dp_50),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(dp_30),
              ),
              gradient: weatherItemPurpleGradient,
            ),
            padding: const EdgeInsets.all(dp_20),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      weatherModelWrapper.weatherModel.city,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize20),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        weatherModelWrapper.weatherModel.isFavourite
                            ? await _viewModel.deleteFavouriteCity(
                                weatherModelWrapper.weatherModel)
                            : await _viewModel.addFavouriteCity(
                                weatherModelWrapper.weatherModel);
                        _viewModel.getFavouriteCities();
                      },
                      icon: weatherModelWrapper.weatherModel.isFavourite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                    )
                  ],
                ),
                Image.network(
                  weatherModelWrapper.weatherModel.icon,
                  fit: BoxFit.cover,
                  width: dp_100,
                  height: dp_80,
                ),
                Text(
                  "${weatherModelWrapper.weatherModel.temperatureC.toString()}${Strings.celsius}",
                  style: f52RWhiteRoboto,
                ),
                Row(
                  children: [
                    Text(
                      weatherModelWrapper.weatherModel.description,
                      style: f16RWhiteRoboto,
                    ),
                    const Spacer(),
                    Text(
                      "${Strings.windDirection} '${weatherModelWrapper.weatherModel.windDir}'",
                      style: f16RWhiteRoboto,
                    ),
                  ],
                )
              ],
            ),
          ),
          //TODO: add forecast API call for current city up to 10 hours
        ],
      ),
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
              _viewModel.fetchWeatherByCity(true, widget.cityName);
            },
            child: const Text(Strings.refresh),
          ),
        ],
      ),
    );
  }
}
