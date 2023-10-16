class Weather {
  final String city;
  final String country;
  final double temperatureF;
  final double temperatureC;
  final String description;
  final String icon;
  final String windDir;

  Weather.fromMap(Map<String, dynamic> json)
      : city = json['location']['name'],
        country = json['location']['country'],
        temperatureF = json['current']['temp_f'],
        temperatureC = json['current']['temp_c'],
        description = json['current']['condition']['text'],
        icon = json['current']['condition']['icon'],
        windDir = json['current']['wind_dir'];
}
