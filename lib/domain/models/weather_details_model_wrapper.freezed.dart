// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_details_model_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherDetailsModelWrapper {
  WeatherModel get weatherModel => throw _privateConstructorUsedError;
  ForecastModelWrapper get forecastModelWrapper =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherDetailsModelWrapperCopyWith<WeatherDetailsModelWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDetailsModelWrapperCopyWith<$Res> {
  factory $WeatherDetailsModelWrapperCopyWith(WeatherDetailsModelWrapper value,
          $Res Function(WeatherDetailsModelWrapper) then) =
      _$WeatherDetailsModelWrapperCopyWithImpl<$Res,
          WeatherDetailsModelWrapper>;
  @useResult
  $Res call(
      {WeatherModel weatherModel, ForecastModelWrapper forecastModelWrapper});

  $WeatherModelCopyWith<$Res> get weatherModel;
  $ForecastModelWrapperCopyWith<$Res> get forecastModelWrapper;
}

/// @nodoc
class _$WeatherDetailsModelWrapperCopyWithImpl<$Res,
        $Val extends WeatherDetailsModelWrapper>
    implements $WeatherDetailsModelWrapperCopyWith<$Res> {
  _$WeatherDetailsModelWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherModel = null,
    Object? forecastModelWrapper = null,
  }) {
    return _then(_value.copyWith(
      weatherModel: null == weatherModel
          ? _value.weatherModel
          : weatherModel // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
      forecastModelWrapper: null == forecastModelWrapper
          ? _value.forecastModelWrapper
          : forecastModelWrapper // ignore: cast_nullable_to_non_nullable
              as ForecastModelWrapper,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherModelCopyWith<$Res> get weatherModel {
    return $WeatherModelCopyWith<$Res>(_value.weatherModel, (value) {
      return _then(_value.copyWith(weatherModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ForecastModelWrapperCopyWith<$Res> get forecastModelWrapper {
    return $ForecastModelWrapperCopyWith<$Res>(_value.forecastModelWrapper,
        (value) {
      return _then(_value.copyWith(forecastModelWrapper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherDetailsModelWrapperCopyWith<$Res>
    implements $WeatherDetailsModelWrapperCopyWith<$Res> {
  factory _$$_WeatherDetailsModelWrapperCopyWith(
          _$_WeatherDetailsModelWrapper value,
          $Res Function(_$_WeatherDetailsModelWrapper) then) =
      __$$_WeatherDetailsModelWrapperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherModel weatherModel, ForecastModelWrapper forecastModelWrapper});

  @override
  $WeatherModelCopyWith<$Res> get weatherModel;
  @override
  $ForecastModelWrapperCopyWith<$Res> get forecastModelWrapper;
}

/// @nodoc
class __$$_WeatherDetailsModelWrapperCopyWithImpl<$Res>
    extends _$WeatherDetailsModelWrapperCopyWithImpl<$Res,
        _$_WeatherDetailsModelWrapper>
    implements _$$_WeatherDetailsModelWrapperCopyWith<$Res> {
  __$$_WeatherDetailsModelWrapperCopyWithImpl(
      _$_WeatherDetailsModelWrapper _value,
      $Res Function(_$_WeatherDetailsModelWrapper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherModel = null,
    Object? forecastModelWrapper = null,
  }) {
    return _then(_$_WeatherDetailsModelWrapper(
      weatherModel: null == weatherModel
          ? _value.weatherModel
          : weatherModel // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
      forecastModelWrapper: null == forecastModelWrapper
          ? _value.forecastModelWrapper
          : forecastModelWrapper // ignore: cast_nullable_to_non_nullable
              as ForecastModelWrapper,
    ));
  }
}

/// @nodoc

class _$_WeatherDetailsModelWrapper extends _WeatherDetailsModelWrapper {
  const _$_WeatherDetailsModelWrapper(
      {required this.weatherModel, required this.forecastModelWrapper})
      : super._();

  @override
  final WeatherModel weatherModel;
  @override
  final ForecastModelWrapper forecastModelWrapper;

  @override
  String toString() {
    return 'WeatherDetailsModelWrapper(weatherModel: $weatherModel, forecastModelWrapper: $forecastModelWrapper)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherDetailsModelWrapper &&
            (identical(other.weatherModel, weatherModel) ||
                other.weatherModel == weatherModel) &&
            (identical(other.forecastModelWrapper, forecastModelWrapper) ||
                other.forecastModelWrapper == forecastModelWrapper));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, weatherModel, forecastModelWrapper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherDetailsModelWrapperCopyWith<_$_WeatherDetailsModelWrapper>
      get copyWith => __$$_WeatherDetailsModelWrapperCopyWithImpl<
          _$_WeatherDetailsModelWrapper>(this, _$identity);
}

abstract class _WeatherDetailsModelWrapper extends WeatherDetailsModelWrapper {
  const factory _WeatherDetailsModelWrapper(
          {required final WeatherModel weatherModel,
          required final ForecastModelWrapper forecastModelWrapper}) =
      _$_WeatherDetailsModelWrapper;
  const _WeatherDetailsModelWrapper._() : super._();

  @override
  WeatherModel get weatherModel;
  @override
  ForecastModelWrapper get forecastModelWrapper;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDetailsModelWrapperCopyWith<_$_WeatherDetailsModelWrapper>
      get copyWith => throw _privateConstructorUsedError;
}
