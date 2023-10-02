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
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.home),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 65, 89, 224),
                  Color.fromARGB(255, 83, 92, 215),
                  Color.fromARGB(255, 162, 163, 208),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
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
        if (data == null) {
          return _buildErrorWidget();
        } else {
          return ref.watch(_homeViewModelProvider).maybeWhen(
              success: (content) => _buildSuccessWidget(data),
              error: (_) => _buildErrorWidget(),
              orElse: () => const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _buildSuccessWidget(WeatherModel weatherModel) {
    return Column(
      children: [
        Text(
          weatherModel.city,
          style: f24Rwhitebold,
        ),
        Text(
          '${weatherModel.temperatureC} ${Strings.celsius}',
          style: f24Rwhitebold,
        ),
        Text(
          weatherModel.description,
          style: f24Rwhitebold,
        ),
      ],
    );
  }

  Widget _buildAnimatedSearchBar() {
    return AnimSearchBar(
      rtl: true,
      width: 400,
      textFieldColor: veryLightTangeloColor,
      color: veryLightTangeloColor,
      textController: textController,
      suffixIcon: const Icon(
        Icons.search,
        color: Colors.black,
        size: 20,
      ),
      onSuffixTap: () async {
        textController.text == ""
            ? log("No city entered")
            : setState(() {
                _viewModel.fetchWeatherByCity(false, textController.text);
              });

        FocusScope.of(context).unfocus();
        textController.clear();
      },
      style: f14RblackLetterSpacing2,
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
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20), // Spacer between text and button
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
