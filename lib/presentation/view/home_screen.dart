import 'dart:developer';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/presentation/constants/constants.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';
import 'package:flutter_weather_app/presentation/viewmodel/home_screen_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _homeViewModelProvider = homeViewModelStateNotifierProvider;
  late HomeViewModel _viewModel;

  TextEditingController textController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    setState(() {
      _viewModel = ref.read(_homeViewModelProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 65, 89, 224),
              Color.fromARGB(255, 83, 92, 215),
              Color.fromARGB(255, 162, 163, 208),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(dp_10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 10, child: _buildAnimatedSearchBar()),
                  Flexible(flex: 16, child: _buildConsumer()),
                ],
              ),
            )));
  }

  Widget _buildConsumer() {
    return Consumer(
      builder: (context, ref, _) {
        var data = ref.watch(_homeViewModelProvider).data;
        return ref.watch(_homeViewModelProvider).maybeWhen(
            success: (content) => _buildSuccessWidget(data!),
            loading: () => const CircularProgressIndicator(),
            error: (_) => _buildErrorWidget(),
            orElse: () => const Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget _buildSuccessWidget(WeatherModel weatherModel) {
    return Column(
      children: [
        Text(
          weatherModel.city,
          style: f24RWhiteBold,
        ),
        Text(
          '${weatherModel.temperatureC} ${Strings.celsius}',
          style: f24RWhiteBold,
        ),
        Text(
          weatherModel.description,
          style: f24RWhiteBold,
        ),
        IconButton(
          onPressed: () async {
            weatherModel.isFavourite
                ? await _viewModel.deleteFavouriteCity(weatherModel)
                : await _viewModel.addFavouriteCity(weatherModel);
            _viewModel.getFavouriteCities();
          },
          padding: const EdgeInsets.all(0),
          icon: (weatherModel.isFavourite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border)),
          color: Colors.red,
          iconSize: 50,
        ),
      ],
    );
  }

  Widget _buildAnimatedSearchBar() {
    return AnimSearchBar(
      rtl: true,
      width: dp_400,
      textFieldColor: veryLightTangeloColor,
      color: veryLightTangeloColor,
      textController: textController,
      suffixIcon: const Icon(
        Icons.search,
        color: Colors.black,
        size: dp_20,
      ),
      onSuffixTap: () {
        textController.text == ""
            ? log(Strings.noCityEntered)
            : _viewModel.fetchWeatherByCity(false, textController.text);

        FocusScope.of(context).unfocus();
        textController.clear();
      },
      style: f14RBlackLetterSpacing2,
      onSubmitted: (_) {},
    );
  }

  Widget _buildErrorWidget() {
    return Column(
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
    );
  }
}
