// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cities_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CitiesListModel {
  List<CityModel> get cityModelList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CitiesListModelCopyWith<CitiesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitiesListModelCopyWith<$Res> {
  factory $CitiesListModelCopyWith(
          CitiesListModel value, $Res Function(CitiesListModel) then) =
      _$CitiesListModelCopyWithImpl<$Res, CitiesListModel>;
  @useResult
  $Res call({List<CityModel> cityModelList});
}

/// @nodoc
class _$CitiesListModelCopyWithImpl<$Res, $Val extends CitiesListModel>
    implements $CitiesListModelCopyWith<$Res> {
  _$CitiesListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityModelList = null,
  }) {
    return _then(_value.copyWith(
      cityModelList: null == cityModelList
          ? _value.cityModelList
          : cityModelList // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CitiesListModelCopyWith<$Res>
    implements $CitiesListModelCopyWith<$Res> {
  factory _$$_CitiesListModelCopyWith(
          _$_CitiesListModel value, $Res Function(_$_CitiesListModel) then) =
      __$$_CitiesListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CityModel> cityModelList});
}

/// @nodoc
class __$$_CitiesListModelCopyWithImpl<$Res>
    extends _$CitiesListModelCopyWithImpl<$Res, _$_CitiesListModel>
    implements _$$_CitiesListModelCopyWith<$Res> {
  __$$_CitiesListModelCopyWithImpl(
      _$_CitiesListModel _value, $Res Function(_$_CitiesListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityModelList = null,
  }) {
    return _then(_$_CitiesListModel(
      cityModelList: null == cityModelList
          ? _value._cityModelList
          : cityModelList // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ));
  }
}

/// @nodoc

class _$_CitiesListModel extends _CitiesListModel {
  const _$_CitiesListModel({required final List<CityModel> cityModelList})
      : _cityModelList = cityModelList,
        super._();

  final List<CityModel> _cityModelList;
  @override
  List<CityModel> get cityModelList {
    if (_cityModelList is EqualUnmodifiableListView) return _cityModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cityModelList);
  }

  @override
  String toString() {
    return 'CitiesListModel(cityModelList: $cityModelList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CitiesListModel &&
            const DeepCollectionEquality()
                .equals(other._cityModelList, _cityModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_cityModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CitiesListModelCopyWith<_$_CitiesListModel> get copyWith =>
      __$$_CitiesListModelCopyWithImpl<_$_CitiesListModel>(this, _$identity);
}

abstract class _CitiesListModel extends CitiesListModel {
  const factory _CitiesListModel(
      {required final List<CityModel> cityModelList}) = _$_CitiesListModel;
  const _CitiesListModel._() : super._();

  @override
  List<CityModel> get cityModelList;
  @override
  @JsonKey(ignore: true)
  _$$_CitiesListModelCopyWith<_$_CitiesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
