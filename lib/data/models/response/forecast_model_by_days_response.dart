class ForecastModelByHoursResponse {
  final String date;
  final ForecastInfo forecastInfo;

  ForecastModelByHoursResponse.fromMap(Map<String, dynamic> json)
      : date = json["time"],
        forecastInfo = ForecastInfo(
          icon: json["condition"]["icon"],
          temperatureC: json["temp_c"],
        );
}

class ForecastModelByDaysResponse {
  String date;
  String description;
  ForecastInfo forecastInfo;

  ForecastModelByDaysResponse.fromMap(Map<String, dynamic> json)
      : date = json["date"],
        forecastInfo = ForecastInfo(
          icon: json["day"]["condition"]["icon"],
          temperatureC: json["day"]["avgtemp_c"],
        ),
        description = json["day"]["condition"]["text"];
}

class ForecastInfo {
  final String icon;
  final double temperatureC;

  ForecastInfo({required this.icon, required this.temperatureC});
}
