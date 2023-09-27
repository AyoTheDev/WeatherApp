class Weather {
  final String city;
  final String temperatureF;
  final String temperatureC;
  final String description;

  Weather.fromMap(Map<String, dynamic> json)
      : city = json['location']['name'],
        temperatureF = json['current']['temp_f'],
        temperatureC = json['current']['temp_c'],
        description = json['current']['condition']['text'];
}
