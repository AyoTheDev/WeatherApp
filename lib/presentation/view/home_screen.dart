import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/constants/strings.dart';

import '../constants/constants.dart';
import '../models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController(text: "");
  Future<WeatherModel>? _myData;

  // Future<WeatherModel> getData(bool isCurrentCity, String cityName) async {
  //   return await WeatherApi().callWeatherAPi(isCurrentCity, cityName);
  // }
  //
  // @override
  // void initState() {
  //   setState(() {
  //     _myData = getData(true, "");
  //   });
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: FutureBuilder(
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If error occurred
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error.toString()} ${Strings.occurred}',
                  style: const TextStyle(fontSize: 18),
                ),
              );

              // if data has no errors
            } else if (snapshot.hasData) {
              final data = snapshot.data as WeatherModel;
              _myData = data as Future<WeatherModel>;
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[
                      Color.fromARGB(255, 65, 89, 224),
                      Color.fromARGB(255, 83, 92, 215),
                      Color.fromARGB(255, 86, 88, 177),
                      Color(0xfff39060),
                      Color(0xffffb56b),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.city,
                              style: f24Rwhitebold,
                            ),
                            height25,
                            Text(
                              data.description,
                              style: f16PW,
                            ),
                            height25,
                            Text(
                              "${data.temperature}${Strings.celsius}",
                              style: f42Rwhitebold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text("${snapshot.connectionState} ${Strings.occurred}"),
            );
          }
          return const Center(
            child: Text(Strings.serverTimedOut),
          );
        },
        future: _myData,
      ),
    );
  }
}
