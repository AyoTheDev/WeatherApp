import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/get_city_by_id_usecase.dart';
import 'package:mockito/mockito.dart';

import '../mock/domain/repository/weather_repository_mock.mocks.dart';

void main() {
  final WeatherRepository weatherRepository = MockWeatherRepository();
  final BaseUseCase<String, CityModel?> getCityByIdUseCase =
      GetCityByIdUseCase(weatherRepository);

  setUp(() {
    when(
      weatherRepository.getCityById("Beijing_China"),
    ).thenAnswer(
      (_) async => const CityModel(
        city: "Beijing",
        country: "China",
      ),
    );
  });

  test('should return CityModel', () async {
    final actual = await getCityByIdUseCase.execute(input: "Beijing_China");
    const expected = CityModel(
      city: "Beijing",
      country: "China",
    );
    expect(expected, actual);
    verify(
      weatherRepository.getCityById("Beijing_China"),
    ).called(1);
  });
}
