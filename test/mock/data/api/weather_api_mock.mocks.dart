// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_weather_app/test/mock/data/api/weather_api_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_weather_app/data/api/weather_api.dart' as _i4;
import 'package:flutter_weather_app/data/models/response/forecast_model_response_wrapper.dart'
    as _i3;
import 'package:flutter_weather_app/data/models/response/suggested_city_model_response.dart'
    as _i6;
import 'package:flutter_weather_app/data/models/response/weather_model_response.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWeather_0 extends _i1.SmartFake implements _i2.Weather {
  _FakeWeather_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForecastModelResponseWrapper_1 extends _i1.SmartFake
    implements _i3.ForecastModelResponseWrapper {
  _FakeForecastModelResponseWrapper_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherApi extends _i1.Mock implements _i4.WeatherApi {
  MockWeatherApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Weather> fetchWeatherByCity(
    bool? isCurrent,
    String? cityName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchWeatherByCity,
          [
            isCurrent,
            cityName,
          ],
        ),
        returnValue: _i5.Future<_i2.Weather>.value(_FakeWeather_0(
          this,
          Invocation.method(
            #fetchWeatherByCity,
            [
              isCurrent,
              cityName,
            ],
          ),
        )),
      ) as _i5.Future<_i2.Weather>);
  @override
  _i5.Future<List<_i6.SuggestedCitiesResponse>> fetchAutoCompleteSearchData(
          String? citySuggestion) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchAutoCompleteSearchData,
          [citySuggestion],
        ),
        returnValue: _i5.Future<List<_i6.SuggestedCitiesResponse>>.value(
            <_i6.SuggestedCitiesResponse>[]),
      ) as _i5.Future<List<_i6.SuggestedCitiesResponse>>);
  @override
  _i5.Future<_i3.ForecastModelResponseWrapper> fetchForecastData(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchForecastData,
          [cityName],
        ),
        returnValue: _i5.Future<_i3.ForecastModelResponseWrapper>.value(
            _FakeForecastModelResponseWrapper_1(
          this,
          Invocation.method(
            #fetchForecastData,
            [cityName],
          ),
        )),
      ) as _i5.Future<_i3.ForecastModelResponseWrapper>);
}