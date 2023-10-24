import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_weather_app/domain/models/weather_model_wrapper.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/view/weather_detalis_screen.dart';
import 'package:flutter_weather_app/presentation/viewmodel/home_screen_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildConsumer(),
    );
  }

  Widget _buildConsumer() {
    return Consumer(
      builder: (context, ref, _) {
        var data = ref.watch(_homeViewModelProvider).data;
        return ref.watch(_homeViewModelProvider).maybeWhen(
              loading: () => _buildLoadingWidget(),
              success: (content) => _buildSuccessWidget(data!),
              error: (_) => _buildErrorWidget(),
              orElse: () => _buildErrorWidget(),
            );
      },
    );
  }

  Widget _buildLoadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _buildSuccessWidget(WeatherModelWrapper weatherModelWrapper) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: dp_50),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: dp_20, right: dp_20),
              child: TypeAheadField(
                debounceDuration:
                    const Duration(milliseconds: durationWithMillis300),
                getImmediateSuggestions: false,
                textFieldConfiguration: TextFieldConfiguration(
                  style: styleOnlyWhiteColor,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: Strings.searchCity,
                    hintStyle: styleOnlyWhiteColor,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                  color: Colors.white12,
                ),
                suggestionsCallback: (suggestedKeyWord) async {
                  return await _viewModel
                      .fetchAutocompleteSearchCity(suggestedKeyWord);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    tileColor: Colors.black45,
                    title: Text(
                      suggestion.citySuggestion,
                      style: styleOnlyWhiteColor,
                    ),
                    onTap: () {
                      _viewModel.fetchWeatherByCity(
                          false, suggestion.citySuggestion);
                    },
                  );
                },
                onSuggestionSelected: (suggestion) {},
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherDetailsScreen(
                      cityName: weatherModelWrapper.weatherModel.city,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: dp_20, right: dp_20, top: dp_150),
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
            )
          ],
        ),
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
              _viewModel.fetchWeatherByCity(true, "");
            },
            child: const Text(Strings.refresh),
          ),
        ],
      ),
    );
  }
}
