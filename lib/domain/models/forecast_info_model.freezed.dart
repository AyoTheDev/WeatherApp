// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForecastInfoModel {
  String get icon => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastInfoModelCopyWith<ForecastInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastInfoModelCopyWith<$Res> {
  factory $ForecastInfoModelCopyWith(
          ForecastInfoModel value, $Res Function(ForecastInfoModel) then) =
      _$ForecastInfoModelCopyWithImpl<$Res, ForecastInfoModel>;
  @useResult
  $Res call({String icon, double temperature});
}

/// @nodoc
class _$ForecastInfoModelCopyWithImpl<$Res, $Val extends ForecastInfoModel>
    implements $ForecastInfoModelCopyWith<$Res> {
  _$ForecastInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? temperature = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastInfoModelImplCopyWith<$Res>
    implements $ForecastInfoModelCopyWith<$Res> {
  factory _$$ForecastInfoModelImplCopyWith(_$ForecastInfoModelImpl value,
          $Res Function(_$ForecastInfoModelImpl) then) =
      __$$ForecastInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String icon, double temperature});
}

/// @nodoc
class __$$ForecastInfoModelImplCopyWithImpl<$Res>
    extends _$ForecastInfoModelCopyWithImpl<$Res, _$ForecastInfoModelImpl>
    implements _$$ForecastInfoModelImplCopyWith<$Res> {
  __$$ForecastInfoModelImplCopyWithImpl(_$ForecastInfoModelImpl _value,
      $Res Function(_$ForecastInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? temperature = null,
  }) {
    return _then(_$ForecastInfoModelImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ForecastInfoModelImpl implements _ForecastInfoModel {
  const _$ForecastInfoModelImpl(
      {required this.icon, required this.temperature});

  @override
  final String icon;
  @override
  final double temperature;

  @override
  String toString() {
    return 'ForecastInfoModel(icon: $icon, temperature: $temperature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastInfoModelImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, temperature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastInfoModelImplCopyWith<_$ForecastInfoModelImpl> get copyWith =>
      __$$ForecastInfoModelImplCopyWithImpl<_$ForecastInfoModelImpl>(
          this, _$identity);
}

abstract class _ForecastInfoModel implements ForecastInfoModel {
  const factory _ForecastInfoModel(
      {required final String icon,
      required final double temperature}) = _$ForecastInfoModelImpl;

  @override
  String get icon;
  @override
  double get temperature;
  @override
  @JsonKey(ignore: true)
  _$$ForecastInfoModelImplCopyWith<_$ForecastInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
