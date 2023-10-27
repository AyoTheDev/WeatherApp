class ForecastModelByHoursResponse {
  final String time;
  final ForecastInfo forecastInfo;

  ForecastModelByHoursResponse.fromMap(Map<String, dynamic> json)
      : time = json["date"],
        forecastInfo = ForecastInfo(
          icon: json["day"]["condition"]["icon"],
          temperatureC: json["temp_c"],
        );
}

class ForecastModelByDaysResponse {
  String days;
  String description;
  ForecastInfo forecastInfo;

  ForecastModelByDaysResponse.fromMap(Map<String, dynamic> json)
      : days = json["date"],
        forecastInfo = ForecastInfo(
          icon: json["day"]["condition"]["icon"],
          temperatureC: json["day"]["avgtemp_c"],
        ),
        description = json["day"]["condition"]["text"];
}

class ForecastInfo {
  final String icon;
  final String temperatureC;

  ForecastInfo({required this.icon, required this.temperatureC});
}
