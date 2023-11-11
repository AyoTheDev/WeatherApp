import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/domain/models/weather_model.dart';
import 'package:flutter_weather_app/domain/models/weather_model_wrapper.dart';
import 'package:flutter_weather_app/presentation/state/state.dart';
import 'package:flutter_weather_app/presentation/viewmodel/home_screen_viewmodel.dart';
import 'package:flutter_weather_app/utils/pair.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_weather_app/domain/base/base_usecase.dart';
import 'package:flutter_weather_app/domain/models/city_model.dart';
import 'package:flutter_weather_app/domain/models/suggested_cities_model.dart';
import 'package:flutter_weather_app/presentation/viewmodel/favourite_cities_viewmodel.dart';

class MockAddFavouriteCityUseCase extends Mock implements BaseUseCase<CityModel, bool> {}
class MockDeleteFavouriteCityUseCase extends Mock implements BaseUseCase<CityModel, bool> {}
class MockFetchAutoCompleteSearchCityUseCase extends Mock implements BaseUseCase<String, List<SuggestedCitiesModel>> {}
class MockFavouriteCitiesViewModel extends Mock implements FavouriteCitiesViewModel {}
class MockFetchWeatherUseCase extends Mock implements BaseUseCase<Pair<bool, String?>, WeatherModel> {}

void main() {
  late MockAddFavouriteCityUseCase mockAddFavouriteCityUseCase;
  late MockDeleteFavouriteCityUseCase mockDeleteFavouriteCityUseCase;
  late MockFetchAutoCompleteSearchCityUseCase mockFetchAutoCompleteSearchCityUseCase;
  late MockFavouriteCitiesViewModel mockFavouriteCitiesViewModel;
  late MockFetchWeatherUseCase mockFetchWeatherUseCase;
  late HomeViewModel viewModel;

  setUp(() {
    mockAddFavouriteCityUseCase = MockAddFavouriteCityUseCase();
    mockDeleteFavouriteCityUseCase = MockDeleteFavouriteCityUseCase();
    mockFetchAutoCompleteSearchCityUseCase = MockFetchAutoCompleteSearchCityUseCase();
    mockFavouriteCitiesViewModel = MockFavouriteCitiesViewModel();
    mockFetchWeatherUseCase = MockFetchWeatherUseCase();

    viewModel = HomeViewModel(
      mockAddFavouriteCityUseCase,
      mockDeleteFavouriteCityUseCase,
      mockFavouriteCitiesViewModel,
      mockFetchAutoCompleteSearchCityUseCase,
      mockFetchWeatherUseCase,
    );
  });

  test('fetchWeatherByCity updates state to success with weather data on successful fetch', () async {
    // Given
    const mockWeatherModel = WeatherModel(
      city: 'Test City',
      country: 'Test Country',
      temperatureF: 68.0,
      temperatureC: 20.0,
      description: 'Sunny',
      isFavourite: false,
      icon: 'sunny.png',
      windDir: 'NE',
    );

    when(mockFetchWeatherUseCase.execute(input: Pair(true, "Test City")))
        .thenAnswer((_) async => mockWeatherModel);

    // When
    await viewModel.fetchWeatherByCity(true, "Test City");

    // Then
    expect(viewModel.state, equals(const State.success(WeatherModelWrapper(weatherModel: mockWeatherModel))));
  });
}
