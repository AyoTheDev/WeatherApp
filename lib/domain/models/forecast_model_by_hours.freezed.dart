// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model_by_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForecastModelByHours {
  String get date => throw _privateConstructorUsedError;
  ForecastInfoModel get forecastInfoModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastModelByHoursCopyWith<ForecastModelByHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastModelByHoursCopyWith<$Res> {
  factory $ForecastModelByHoursCopyWith(ForecastModelByHours value,
          $Res Function(ForecastModelByHours) then) =
      _$ForecastModelByHoursCopyWithImpl<$Res, ForecastModelByHours>;
  @useResult
  $Res call({String date, ForecastInfoModel forecastInfoModel});

  $ForecastInfoModelCopyWith<$Res> get forecastInfoModel;
}

/// @nodoc
class _$ForecastModelByHoursCopyWithImpl<$Res,
        $Val extends ForecastModelByHours>
    implements $ForecastModelByHoursCopyWith<$Res> {
  _$ForecastModelByHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? forecastInfoModel = null,
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
abstract class _$$ForecastModelByHoursImplCopyWith<$Res>
    implements $ForecastModelByHoursCopyWith<$Res> {
  factory _$$ForecastModelByHoursImplCopyWith(_$ForecastModelByHoursImpl value,
          $Res Function(_$ForecastModelByHoursImpl) then) =
      __$$ForecastModelByHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, ForecastInfoModel forecastInfoModel});

  @override
  $ForecastInfoModelCopyWith<$Res> get forecastInfoModel;
}

/// @nodoc
class __$$ForecastModelByHoursImplCopyWithImpl<$Res>
    extends _$ForecastModelByHoursCopyWithImpl<$Res, _$ForecastModelByHoursImpl>
    implements _$$ForecastModelByHoursImplCopyWith<$Res> {
  __$$ForecastModelByHoursImplCopyWithImpl(_$ForecastModelByHoursImpl _value,
      $Res Function(_$ForecastModelByHoursImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? forecastInfoModel = null,
  }) {
    return _then(_$ForecastModelByHoursImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      forecastInfoModel: null == forecastInfoModel
          ? _value.forecastInfoModel
          : forecastInfoModel // ignore: cast_nullable_to_non_nullable
              as ForecastInfoModel,
    ));
  }
}

/// @nodoc

class _$ForecastModelByHoursImpl extends _ForecastModelByHours {
  const _$ForecastModelByHoursImpl(
      {required this.date, required this.forecastInfoModel})
      : super._();

  @override
  final String date;
  @override
  final ForecastInfoModel forecastInfoModel;

  @override
  String toString() {
    return 'ForecastModelByHours(date: $date, forecastInfoModel: $forecastInfoModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastModelByHoursImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.forecastInfoModel, forecastInfoModel) ||
                other.forecastInfoModel == forecastInfoModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, forecastInfoModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastModelByHoursImplCopyWith<_$ForecastModelByHoursImpl>
      get copyWith =>
          __$$ForecastModelByHoursImplCopyWithImpl<_$ForecastModelByHoursImpl>(
              this, _$identity);
}

abstract class _ForecastModelByHours extends ForecastModelByHours {
  const factory _ForecastModelByHours(
          {required final String date,
          required final ForecastInfoModel forecastInfoModel}) =
      _$ForecastModelByHoursImpl;
  const _ForecastModelByHours._() : super._();

  @override
  String get date;
  @override
  ForecastInfoModel get forecastInfoModel;
  @override
  @JsonKey(ignore: true)
  _$$ForecastModelByHoursImplCopyWith<_$ForecastModelByHoursImpl>
      get copyWith => throw _privateConstructorUsedError;
}
