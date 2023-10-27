// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherModelWrapper {
  WeatherModel get weatherModel => throw _privateConstructorUsedError;
  SuggestedCitiesModel? get suggestedCitiesModel =>
      throw _privateConstructorUsedError;
  List<String>? get suggestions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherModelWrapperCopyWith<WeatherModelWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelWrapperCopyWith<$Res> {
  factory $WeatherModelWrapperCopyWith(
          WeatherModelWrapper value, $Res Function(WeatherModelWrapper) then) =
      _$WeatherModelWrapperCopyWithImpl<$Res, WeatherModelWrapper>;
  @useResult
  $Res call(
      {WeatherModel weatherModel,
      SuggestedCitiesModel? suggestedCitiesModel,
      List<String>? suggestions});

  $WeatherModelCopyWith<$Res> get weatherModel;
  $SuggestedCitiesModelCopyWith<$Res>? get suggestedCitiesModel;
}

/// @nodoc
class _$WeatherModelWrapperCopyWithImpl<$Res, $Val extends WeatherModelWrapper>
    implements $WeatherModelWrapperCopyWith<$Res> {
  _$WeatherModelWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherModel = null,
    Object? suggestedCitiesModel = freezed,
    Object? suggestions = freezed,
  }) {
    return _then(_value.copyWith(
      weatherModel: null == weatherModel
          ? _value.weatherModel
          : weatherModel // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
      suggestedCitiesModel: freezed == suggestedCitiesModel
          ? _value.suggestedCitiesModel
          : suggestedCitiesModel // ignore: cast_nullable_to_non_nullable
              as SuggestedCitiesModel?,
      suggestions: freezed == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
  $SuggestedCitiesModelCopyWith<$Res>? get suggestedCitiesModel {
    if (_value.suggestedCitiesModel == null) {
      return null;
    }

    return $SuggestedCitiesModelCopyWith<$Res>(_value.suggestedCitiesModel!,
        (value) {
      return _then(_value.copyWith(suggestedCitiesModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherModelWrapperImplCopyWith<$Res>
    implements $WeatherModelWrapperCopyWith<$Res> {
  factory _$$WeatherModelWrapperImplCopyWith(_$WeatherModelWrapperImpl value,
          $Res Function(_$WeatherModelWrapperImpl) then) =
      __$$WeatherModelWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherModel weatherModel,
      SuggestedCitiesModel? suggestedCitiesModel,
      List<String>? suggestions});

  @override
  $WeatherModelCopyWith<$Res> get weatherModel;
  @override
  $SuggestedCitiesModelCopyWith<$Res>? get suggestedCitiesModel;
}

/// @nodoc
class __$$WeatherModelWrapperImplCopyWithImpl<$Res>
    extends _$WeatherModelWrapperCopyWithImpl<$Res, _$WeatherModelWrapperImpl>
    implements _$$WeatherModelWrapperImplCopyWith<$Res> {
  __$$WeatherModelWrapperImplCopyWithImpl(_$WeatherModelWrapperImpl _value,
      $Res Function(_$WeatherModelWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherModel = null,
    Object? suggestedCitiesModel = freezed,
    Object? suggestions = freezed,
  }) {
    return _then(_$WeatherModelWrapperImpl(
      weatherModel: null == weatherModel
          ? _value.weatherModel
          : weatherModel // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
      suggestedCitiesModel: freezed == suggestedCitiesModel
          ? _value.suggestedCitiesModel
          : suggestedCitiesModel // ignore: cast_nullable_to_non_nullable
              as SuggestedCitiesModel?,
      suggestions: freezed == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$WeatherModelWrapperImpl extends _WeatherModelWrapper {
  const _$WeatherModelWrapperImpl(
      {required this.weatherModel,
      this.suggestedCitiesModel,
      final List<String>? suggestions})
      : _suggestions = suggestions,
        super._();

  @override
  final WeatherModel weatherModel;
  @override
  final SuggestedCitiesModel? suggestedCitiesModel;
  final List<String>? _suggestions;
  @override
  List<String>? get suggestions {
    final value = _suggestions;
    if (value == null) return null;
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeatherModelWrapper(weatherModel: $weatherModel, suggestedCitiesModel: $suggestedCitiesModel, suggestions: $suggestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherModelWrapperImpl &&
            (identical(other.weatherModel, weatherModel) ||
                other.weatherModel == weatherModel) &&
            (identical(other.suggestedCitiesModel, suggestedCitiesModel) ||
                other.suggestedCitiesModel == suggestedCitiesModel) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weatherModel,
      suggestedCitiesModel, const DeepCollectionEquality().hash(_suggestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherModelWrapperImplCopyWith<_$WeatherModelWrapperImpl> get copyWith =>
      __$$WeatherModelWrapperImplCopyWithImpl<_$WeatherModelWrapperImpl>(
          this, _$identity);
}

abstract class _WeatherModelWrapper extends WeatherModelWrapper {
  const factory _WeatherModelWrapper(
      {required final WeatherModel weatherModel,
      final SuggestedCitiesModel? suggestedCitiesModel,
      final List<String>? suggestions}) = _$WeatherModelWrapperImpl;
  const _WeatherModelWrapper._() : super._();

  @override
  WeatherModel get weatherModel;
  @override
  SuggestedCitiesModel? get suggestedCitiesModel;
  @override
  List<String>? get suggestions;
  @override
  @JsonKey(ignore: true)
  _$$WeatherModelWrapperImplCopyWith<_$WeatherModelWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
