class Weather {
  final String city;
  final String country;
  final double temperatureF;
  final double temperatureC;
  final String description;

  Weather.fromMap(Map<String, dynamic> json)
      : city = json['location']['name'],
        country = json['location']['country'],
        temperatureF = json['current']['temp_f'],
        temperatureC = json['current']['temp_c'],
        description = json['current']['condition']['text'];
}
