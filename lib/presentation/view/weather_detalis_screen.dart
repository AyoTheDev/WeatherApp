import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/models/weather_details_model_wrapper.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/theme_provider.dart';
import 'package:flutter_weather_app/presentation/viewmodel/weather_details_viewmodel.dart';

class WeatherDetailsScreen extends ConsumerWidget {
  final String cityName;

  WeatherDetailsScreen({required this.cityName, super.key});

  final _weatherDetailsViewModelProvider =
      weatherDetailsViewModelStateNotifierProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: _buildWidgetState(context, isDarkMode, ref),
        ));
  }

  Widget _buildWidgetState(
    BuildContext context,
    bool isDarkMode,
    WidgetRef ref,
  ) {
    return ref.watch(_weatherDetailsViewModelProvider).maybeWhen(
          loading: () => _buildLoadingWidget(),
          success: (date) => _buildSuccessWidget(date, isDarkMode, ref),
          error: (_) => _buildErrorWidget(ref),
          orElse: () => _buildLoadingWidget(),
        );
  }

  Widget _buildLoadingWidget() =>
      const Center(child: CircularProgressIndicator());

  Widget _buildSuccessWidget(
    WeatherDetailsModelWrapper weatherDetailsModelWrapper,
    bool isDarkMode,
    WidgetRef ref,
  ) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCityWeatherInfo(weatherDetailsModelWrapper, isDarkMode, ref),
          _buildForecastWeatherByHours(weatherDetailsModelWrapper, ref),
          _buildForecastWeatherByDays(weatherDetailsModelWrapper, ref),
          const Spacer()
        ],
      ),
    );
  }

  Widget _buildCityWeatherInfo(
    WeatherDetailsModelWrapper weatherDetailsModelWrapper,
    bool isDarkMode,
    WidgetRef ref,
  ) {
    final viewModel = ref.read(_weatherDetailsViewModelProvider.notifier);
    return Container(
      margin: const EdgeInsets.only(left: dp_20, right: dp_20, top: dp_50),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(dp_30),
        ),
        gradient: isDarkMode
            ? weatherItemDarkModeGradient
            : weatherItemLightModeGradient,
      ),
      padding: const EdgeInsets.all(dp_20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                weatherDetailsModelWrapper.weatherModel.city,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize20),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  weatherDetailsModelWrapper.weatherModel.isFavourite
                      ? await viewModel.deleteFavouriteCity(
                          weatherDetailsModelWrapper.weatherModel)
                      : await viewModel.addFavouriteCity(
                          weatherDetailsModelWrapper.weatherModel);
                  viewModel.getFavouriteCities();
                },
                icon: weatherDetailsModelWrapper.weatherModel.isFavourite
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
            weatherDetailsModelWrapper.weatherModel.icon,
            fit: BoxFit.cover,
            width: dp_100,
            height: dp_80,
          ),
          Text(
            "${weatherDetailsModelWrapper.weatherModel.temperatureC.toString()}${Strings.celsius}",
            style: f52RWhiteRoboto,
          ),
          Row(
            children: [
              Text(
                weatherDetailsModelWrapper.weatherModel.description,
                style: f16RWhiteRoboto,
              ),
              const Spacer(),
              Text(
                "${Strings.windDirection} '${weatherDetailsModelWrapper.weatherModel.windDir}'",
                style: f16RWhiteRoboto,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildForecastWeatherByHours(
    WeatherDetailsModelWrapper weatherDetailsModelWrapper,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.all(dp_16),
      child: Container(
        padding: const EdgeInsets.all(dp_16),
        decoration: BoxDecoration(
          color: sageViolet,
          borderRadius: const BorderRadius.all(
            Radius.circular(dp_30),
          ),
        ),
        width: double.infinity,
        height: dp_126,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherDetailsModelWrapper
              .forecastModelWrapper.forecastModelByHours.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(dp_2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weatherDetailsModelWrapper
                        .forecastModelWrapper.forecastModelByHours[index].date,
                    style: f12WhiteRoboto,
                  ),
                  Image.network(
                    weatherDetailsModelWrapper.forecastModelWrapper
                        .forecastModelByHours[index].forecastInfoModel.icon,
                    width: dp_50,
                    height: dp_50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "${weatherDetailsModelWrapper.forecastModelWrapper.forecastModelByHours[index].forecastInfoModel.temperature.toString()}${Strings.celsius}",
                    style: f12WhiteRoboto,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildForecastWeatherByDays(
    WeatherDetailsModelWrapper weatherDetailsModelWrapper,
    WidgetRef ref,
  ) {
    return Container(
      padding: const EdgeInsets.all(dp_16),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(dp_30),
        ),
      ),
      width: double.infinity,
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDetailsModelWrapper
            .forecastModelWrapper.forecastModelByDays.length,
        itemBuilder: (context, index) {
          return Container(
              width: 90,
              margin: const EdgeInsets.all(dp_2),
              decoration: BoxDecoration(
                color: sageViolet,
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      weatherDetailsModelWrapper
                          .forecastModelWrapper.forecastModelByDays[index].date,
                      style: f12WhiteRoboto,
                      textAlign: TextAlign.center,
                    ),
                    Image.network(
                      weatherDetailsModelWrapper.forecastModelWrapper
                          .forecastModelByDays[index].forecastInfoModel.icon,
                      width: dp_50,
                      height: dp_50,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: dp_10),
                      child: Text(
                        "${weatherDetailsModelWrapper.forecastModelWrapper.forecastModelByDays[index].forecastInfoModel.temperature.toString()}${Strings.celsius}",
                        style: f12WhiteRoboto,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: dp_10),
                      child: Text(
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        weatherDetailsModelWrapper.forecastModelWrapper
                            .forecastModelByDays[index].description,
                        style: f12WhiteRoboto,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget _buildErrorWidget(WidgetRef ref) {
    final viewModel = ref.read(_weatherDetailsViewModelProvider.notifier);
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
              viewModel.fetchWeatherByCity(cityName);
            },
            child: const Text(Strings.refresh),
          ),
        ],
      ),
    );
  }
}
