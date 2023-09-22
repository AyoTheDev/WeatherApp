class WeatherModel {
  final String temperature;
  final String city;
  final String description;

  WeatherModel.fromMap(Map<String, dynamic> json)
      : temperature = json['main']['temp'].toString(),
        city = json['name'],
        description = json['weather'][0]['description'];
}