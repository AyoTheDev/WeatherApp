// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggested_cities_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestedCitiesModel {
  String get citySuggestion => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestedCitiesModelCopyWith<SuggestedCitiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedCitiesModelCopyWith<$Res> {
  factory $SuggestedCitiesModelCopyWith(SuggestedCitiesModel value,
          $Res Function(SuggestedCitiesModel) then) =
      _$SuggestedCitiesModelCopyWithImpl<$Res, SuggestedCitiesModel>;
  @useResult
  $Res call({String citySuggestion, String country});
}

/// @nodoc
class _$SuggestedCitiesModelCopyWithImpl<$Res,
        $Val extends SuggestedCitiesModel>
    implements $SuggestedCitiesModelCopyWith<$Res> {
  _$SuggestedCitiesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? citySuggestion = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      citySuggestion: null == citySuggestion
          ? _value.citySuggestion
          : citySuggestion // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestedCitiesModelImplCopyWith<$Res>
    implements $SuggestedCitiesModelCopyWith<$Res> {
  factory _$$SuggestedCitiesModelImplCopyWith(_$SuggestedCitiesModelImpl value,
          $Res Function(_$SuggestedCitiesModelImpl) then) =
      __$$SuggestedCitiesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String citySuggestion, String country});
}

/// @nodoc
class __$$SuggestedCitiesModelImplCopyWithImpl<$Res>
    extends _$SuggestedCitiesModelCopyWithImpl<$Res, _$SuggestedCitiesModelImpl>
    implements _$$SuggestedCitiesModelImplCopyWith<$Res> {
  __$$SuggestedCitiesModelImplCopyWithImpl(_$SuggestedCitiesModelImpl _value,
      $Res Function(_$SuggestedCitiesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? citySuggestion = null,
    Object? country = null,
  }) {
    return _then(_$SuggestedCitiesModelImpl(
      citySuggestion: null == citySuggestion
          ? _value.citySuggestion
          : citySuggestion // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuggestedCitiesModelImpl extends _SuggestedCitiesModel {
  const _$SuggestedCitiesModelImpl(
      {required this.citySuggestion, required this.country})
      : super._();

  @override
  final String citySuggestion;
  @override
  final String country;

  @override
  String toString() {
    return 'SuggestedCitiesModel(citySuggestion: $citySuggestion, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedCitiesModelImpl &&
            (identical(other.citySuggestion, citySuggestion) ||
                other.citySuggestion == citySuggestion) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, citySuggestion, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedCitiesModelImplCopyWith<_$SuggestedCitiesModelImpl>
      get copyWith =>
          __$$SuggestedCitiesModelImplCopyWithImpl<_$SuggestedCitiesModelImpl>(
              this, _$identity);
}

abstract class _SuggestedCitiesModel extends SuggestedCitiesModel {
  const factory _SuggestedCitiesModel(
      {required final String citySuggestion,
      required final String country}) = _$SuggestedCitiesModelImpl;
  const _SuggestedCitiesModel._() : super._();

  @override
  String get citySuggestion;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$SuggestedCitiesModelImplCopyWith<_$SuggestedCitiesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
