class SuggestedCitiesResponse {
  final String city;
  final String country;

  SuggestedCitiesResponse.fromMap(Map<String, dynamic> json)
      : city = json['name'],
        country = json['country'];
}
