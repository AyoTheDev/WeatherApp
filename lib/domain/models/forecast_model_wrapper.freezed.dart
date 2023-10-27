// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForecastModelWrapper {
  List<ForecastModelByDays> get forecastModelByDays =>
      throw _privateConstructorUsedError;
  List<ForecastModelByHours> get forecastModelByHours =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastModelWrapperCopyWith<ForecastModelWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastModelWrapperCopyWith<$Res> {
  factory $ForecastModelWrapperCopyWith(ForecastModelWrapper value,
          $Res Function(ForecastModelWrapper) then) =
      _$ForecastModelWrapperCopyWithImpl<$Res, ForecastModelWrapper>;
  @useResult
  $Res call(
      {List<ForecastModelByDays> forecastModelByDays,
      List<ForecastModelByHours> forecastModelByHours});
}

/// @nodoc
class _$ForecastModelWrapperCopyWithImpl<$Res,
        $Val extends ForecastModelWrapper>
    implements $ForecastModelWrapperCopyWith<$Res> {
  _$ForecastModelWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forecastModelByDays = null,
    Object? forecastModelByHours = null,
  }) {
    return _then(_value.copyWith(
      forecastModelByDays: null == forecastModelByDays
          ? _value.forecastModelByDays
          : forecastModelByDays // ignore: cast_nullable_to_non_nullable
              as List<ForecastModelByDays>,
      forecastModelByHours: null == forecastModelByHours
          ? _value.forecastModelByHours
          : forecastModelByHours // ignore: cast_nullable_to_non_nullable
              as List<ForecastModelByHours>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastModelWrapperImplCopyWith<$Res>
    implements $ForecastModelWrapperCopyWith<$Res> {
  factory _$$ForecastModelWrapperImplCopyWith(_$ForecastModelWrapperImpl value,
          $Res Function(_$ForecastModelWrapperImpl) then) =
      __$$ForecastModelWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ForecastModelByDays> forecastModelByDays,
      List<ForecastModelByHours> forecastModelByHours});
}

/// @nodoc
class __$$ForecastModelWrapperImplCopyWithImpl<$Res>
    extends _$ForecastModelWrapperCopyWithImpl<$Res, _$ForecastModelWrapperImpl>
    implements _$$ForecastModelWrapperImplCopyWith<$Res> {
  __$$ForecastModelWrapperImplCopyWithImpl(_$ForecastModelWrapperImpl _value,
      $Res Function(_$ForecastModelWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forecastModelByDays = null,
    Object? forecastModelByHours = null,
  }) {
    return _then(_$ForecastModelWrapperImpl(
      forecastModelByDays: null == forecastModelByDays
          ? _value._forecastModelByDays
          : forecastModelByDays // ignore: cast_nullable_to_non_nullable
              as List<ForecastModelByDays>,
      forecastModelByHours: null == forecastModelByHours
          ? _value._forecastModelByHours
          : forecastModelByHours // ignore: cast_nullable_to_non_nullable
              as List<ForecastModelByHours>,
    ));
  }
}

/// @nodoc

class _$ForecastModelWrapperImpl extends _ForecastModelWrapper {
  const _$ForecastModelWrapperImpl(
      {required final List<ForecastModelByDays> forecastModelByDays,
      required final List<ForecastModelByHours> forecastModelByHours})
      : _forecastModelByDays = forecastModelByDays,
        _forecastModelByHours = forecastModelByHours,
        super._();

  final List<ForecastModelByDays> _forecastModelByDays;
  @override
  List<ForecastModelByDays> get forecastModelByDays {
    if (_forecastModelByDays is EqualUnmodifiableListView)
      return _forecastModelByDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecastModelByDays);
  }

  final List<ForecastModelByHours> _forecastModelByHours;
  @override
  List<ForecastModelByHours> get forecastModelByHours {
    if (_forecastModelByHours is EqualUnmodifiableListView)
      return _forecastModelByHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecastModelByHours);
  }

  @override
  String toString() {
    return 'ForecastModelWrapper(forecastModelByDays: $forecastModelByDays, forecastModelByHours: $forecastModelByHours)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastModelWrapperImpl &&
            const DeepCollectionEquality()
                .equals(other._forecastModelByDays, _forecastModelByDays) &&
            const DeepCollectionEquality()
                .equals(other._forecastModelByHours, _forecastModelByHours));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_forecastModelByDays),
      const DeepCollectionEquality().hash(_forecastModelByHours));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastModelWrapperImplCopyWith<_$ForecastModelWrapperImpl>
      get copyWith =>
          __$$ForecastModelWrapperImplCopyWithImpl<_$ForecastModelWrapperImpl>(
              this, _$identity);
}

abstract class _ForecastModelWrapper extends ForecastModelWrapper {
  const factory _ForecastModelWrapper(
          {required final List<ForecastModelByDays> forecastModelByDays,
          required final List<ForecastModelByHours> forecastModelByHours}) =
      _$ForecastModelWrapperImpl;
  const _ForecastModelWrapper._() : super._();

  @override
  List<ForecastModelByDays> get forecastModelByDays;
  @override
  List<ForecastModelByHours> get forecastModelByHours;
  @override
  @JsonKey(ignore: true)
  _$$ForecastModelWrapperImplCopyWith<_$ForecastModelWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}
