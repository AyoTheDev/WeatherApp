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
  String get date => throw _privateConstructorUsedError;
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
      {String date, ForecastInfoModel forecastInfoModel, String description});

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
    Object? date = null,
    Object? forecastInfoModel = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ForecastModelByDaysImplCopyWith<$Res>
    implements $ForecastModelByDaysCopyWith<$Res> {
  factory _$$ForecastModelByDaysImplCopyWith(_$ForecastModelByDaysImpl value,
          $Res Function(_$ForecastModelByDaysImpl) then) =
      __$$ForecastModelByDaysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date, ForecastInfoModel forecastInfoModel, String description});

  @override
  $ForecastInfoModelCopyWith<$Res> get forecastInfoModel;
}

/// @nodoc
class __$$ForecastModelByDaysImplCopyWithImpl<$Res>
    extends _$ForecastModelByDaysCopyWithImpl<$Res, _$ForecastModelByDaysImpl>
    implements _$$ForecastModelByDaysImplCopyWith<$Res> {
  __$$ForecastModelByDaysImplCopyWithImpl(_$ForecastModelByDaysImpl _value,
      $Res Function(_$ForecastModelByDaysImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? forecastInfoModel = null,
    Object? description = null,
  }) {
    return _then(_$ForecastModelByDaysImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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

class _$ForecastModelByDaysImpl extends _ForecastModelByDays {
  const _$ForecastModelByDaysImpl(
      {required this.date,
      required this.forecastInfoModel,
      required this.description})
      : super._();

  @override
  final String date;
  @override
  final ForecastInfoModel forecastInfoModel;
  @override
  final String description;

  @override
  String toString() {
    return 'ForecastModelByDays(date: $date, forecastInfoModel: $forecastInfoModel, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastModelByDaysImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.forecastInfoModel, forecastInfoModel) ||
                other.forecastInfoModel == forecastInfoModel) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, forecastInfoModel, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastModelByDaysImplCopyWith<_$ForecastModelByDaysImpl> get copyWith =>
      __$$ForecastModelByDaysImplCopyWithImpl<_$ForecastModelByDaysImpl>(
          this, _$identity);
}

abstract class _ForecastModelByDays extends ForecastModelByDays {
  const factory _ForecastModelByDays(
      {required final String date,
      required final ForecastInfoModel forecastInfoModel,
      required final String description}) = _$ForecastModelByDaysImpl;
  const _ForecastModelByDays._() : super._();

  @override
  String get date;
  @override
  ForecastInfoModel get forecastInfoModel;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$ForecastModelByDaysImplCopyWith<_$ForecastModelByDaysImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
