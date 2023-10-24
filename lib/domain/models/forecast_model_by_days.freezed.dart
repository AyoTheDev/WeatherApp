// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model_by_days.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForecastModelByDays {
  String get day => throw _privateConstructorUsedError;
  ForecastInfoModel get forecastInfoModel => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastModelByDaysCopyWith<ForecastModelByDays> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastModelByDaysCopyWith<$Res> {
  factory $ForecastModelByDaysCopyWith(
          ForecastModelByDays value, $Res Function(ForecastModelByDays) then) =
      _$ForecastModelByDaysCopyWithImpl<$Res, ForecastModelByDays>;
  @useResult
  $Res call(
      {String day, ForecastInfoModel forecastInfoModel, String description});

  $ForecastInfoModelCopyWith<$Res> get forecastInfoModel;
}

/// @nodoc
class _$ForecastModelByDaysCopyWithImpl<$Res, $Val extends ForecastModelByDays>
    implements $ForecastModelByDaysCopyWith<$Res> {
  _$ForecastModelByDaysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? forecastInfoModel = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      forecastInfoModel: null == forecastInfoModel
          ? _value.forecastInfoModel
          : forecastInfoModel // ignore: cast_nullable_to_non_nullable
              as ForecastInfoModel,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ForecastInfoModelCopyWith<$Res> get forecastInfoModel {
    return $ForecastInfoModelCopyWith<$Res>(_value.forecastInfoModel, (value) {
      return _then(_value.copyWith(forecastInfoModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ForecastModelByDaysCopyWith<$Res>
    implements $ForecastModelByDaysCopyWith<$Res> {
  factory _$$_ForecastModelByDaysCopyWith(_$_ForecastModelByDays value,
          $Res Function(_$_ForecastModelByDays) then) =
      __$$_ForecastModelByDaysCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String day, ForecastInfoModel forecastInfoModel, String description});

  @override
  $ForecastInfoModelCopyWith<$Res> get forecastInfoModel;
}

/// @nodoc
class __$$_ForecastModelByDaysCopyWithImpl<$Res>
    extends _$ForecastModelByDaysCopyWithImpl<$Res, _$_ForecastModelByDays>
    implements _$$_ForecastModelByDaysCopyWith<$Res> {
  __$$_ForecastModelByDaysCopyWithImpl(_$_ForecastModelByDays _value,
      $Res Function(_$_ForecastModelByDays) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? forecastInfoModel = null,
    Object? description = null,
  }) {
    return _then(_$_ForecastModelByDays(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      forecastInfoModel: null == forecastInfoModel
          ? _value.forecastInfoModel
          : forecastInfoModel // ignore: cast_nullable_to_non_nullable
              as ForecastInfoModel,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForecastModelByDays extends _ForecastModelByDays {
  const _$_ForecastModelByDays(
      {required this.day,
      required this.forecastInfoModel,
      required this.description})
      : super._();

  @override
  final String day;
  @override
  final ForecastInfoModel forecastInfoModel;
  @override
  final String description;

  @override
  String toString() {
    return 'ForecastModelByDays(day: $day, forecastInfoModel: $forecastInfoModel, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForecastModelByDays &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.forecastInfoModel, forecastInfoModel) ||
                other.forecastInfoModel == forecastInfoModel) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, day, forecastInfoModel, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForecastModelByDaysCopyWith<_$_ForecastModelByDays> get copyWith =>
      __$$_ForecastModelByDaysCopyWithImpl<_$_ForecastModelByDays>(
          this, _$identity);
}

abstract class _ForecastModelByDays extends ForecastModelByDays {
  const factory _ForecastModelByDays(
      {required final String day,
      required final ForecastInfoModel forecastInfoModel,
      required final String description}) = _$_ForecastModelByDays;
  const _ForecastModelByDays._() : super._();

  @override
  String get day;
  @override
  ForecastInfoModel get forecastInfoModel;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastModelByDaysCopyWith<_$_ForecastModelByDays> get copyWith =>
      throw _privateConstructorUsedError;
}
