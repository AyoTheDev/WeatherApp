typedef WeatherListModel = List<WeatherModel>;
typedef WeatherModel = Map<String, dynamic>;

// class CityModel {
//   final String temperature;
//   final String city;
//   final String description;
//
//   CityModel.fromMap(Map<String, dynamic> json)
//       : temperature = json['main']['temperature'].toString(),
//         city = json['name'],
//         description = json['weather'][0]['description'];
// }