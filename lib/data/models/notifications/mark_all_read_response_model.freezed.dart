// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_all_read_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarkAllReadResponseModel {

 bool? get success; String? get message; MarkAllReadData? get data;
/// Create a copy of MarkAllReadResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkAllReadResponseModelCopyWith<MarkAllReadResponseModel> get copyWith => _$MarkAllReadResponseModelCopyWithImpl<MarkAllReadResponseModel>(this as MarkAllReadResponseModel, _$identity);

  /// Serializes this MarkAllReadResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkAllReadResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'MarkAllReadResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $MarkAllReadResponseModelCopyWith<$Res>  {
  factory $MarkAllReadResponseModelCopyWith(MarkAllReadResponseModel value, $Res Function(MarkAllReadResponseModel) _then) = _$MarkAllReadResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, MarkAllReadData? data
});


$MarkAllReadDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$MarkAllReadResponseModelCopyWithImpl<$Res>
    implements $MarkAllReadResponseModelCopyWith<$Res> {
  _$MarkAllReadResponseModelCopyWithImpl(this._self, this._then);

  final MarkAllReadResponseModel _self;
  final $Res Function(MarkAllReadResponseModel) _then;

/// Create a copy of MarkAllReadResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MarkAllReadData?,
  ));
}
/// Create a copy of MarkAllReadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarkAllReadDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MarkAllReadDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MarkAllReadResponseModel implements MarkAllReadResponseModel {
  const _MarkAllReadResponseModel({this.success, this.message, this.data});
  factory _MarkAllReadResponseModel.fromJson(Map<String, dynamic> json) => _$MarkAllReadResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  MarkAllReadData? data;

/// Create a copy of MarkAllReadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAllReadResponseModelCopyWith<_MarkAllReadResponseModel> get copyWith => __$MarkAllReadResponseModelCopyWithImpl<_MarkAllReadResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkAllReadResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAllReadResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'MarkAllReadResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MarkAllReadResponseModelCopyWith<$Res> implements $MarkAllReadResponseModelCopyWith<$Res> {
  factory _$MarkAllReadResponseModelCopyWith(_MarkAllReadResponseModel value, $Res Function(_MarkAllReadResponseModel) _then) = __$MarkAllReadResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, MarkAllReadData? data
});


@override $MarkAllReadDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$MarkAllReadResponseModelCopyWithImpl<$Res>
    implements _$MarkAllReadResponseModelCopyWith<$Res> {
  __$MarkAllReadResponseModelCopyWithImpl(this._self, this._then);

  final _MarkAllReadResponseModel _self;
  final $Res Function(_MarkAllReadResponseModel) _then;

/// Create a copy of MarkAllReadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_MarkAllReadResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MarkAllReadData?,
  ));
}

/// Create a copy of MarkAllReadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarkAllReadDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MarkAllReadDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$MarkAllReadData {

 int? get count;
/// Create a copy of MarkAllReadData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkAllReadDataCopyWith<MarkAllReadData> get copyWith => _$MarkAllReadDataCopyWithImpl<MarkAllReadData>(this as MarkAllReadData, _$identity);

  /// Serializes this MarkAllReadData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkAllReadData&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'MarkAllReadData(count: $count)';
}


}

/// @nodoc
abstract mixin class $MarkAllReadDataCopyWith<$Res>  {
  factory $MarkAllReadDataCopyWith(MarkAllReadData value, $Res Function(MarkAllReadData) _then) = _$MarkAllReadDataCopyWithImpl;
@useResult
$Res call({
 int? count
});




}
/// @nodoc
class _$MarkAllReadDataCopyWithImpl<$Res>
    implements $MarkAllReadDataCopyWith<$Res> {
  _$MarkAllReadDataCopyWithImpl(this._self, this._then);

  final MarkAllReadData _self;
  final $Res Function(MarkAllReadData) _then;

/// Create a copy of MarkAllReadData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = freezed,}) {
  return _then(_self.copyWith(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MarkAllReadData implements MarkAllReadData {
  const _MarkAllReadData({this.count});
  factory _MarkAllReadData.fromJson(Map<String, dynamic> json) => _$MarkAllReadDataFromJson(json);

@override final  int? count;

/// Create a copy of MarkAllReadData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAllReadDataCopyWith<_MarkAllReadData> get copyWith => __$MarkAllReadDataCopyWithImpl<_MarkAllReadData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkAllReadDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAllReadData&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'MarkAllReadData(count: $count)';
}


}

/// @nodoc
abstract mixin class _$MarkAllReadDataCopyWith<$Res> implements $MarkAllReadDataCopyWith<$Res> {
  factory _$MarkAllReadDataCopyWith(_MarkAllReadData value, $Res Function(_MarkAllReadData) _then) = __$MarkAllReadDataCopyWithImpl;
@override @useResult
$Res call({
 int? count
});




}
/// @nodoc
class __$MarkAllReadDataCopyWithImpl<$Res>
    implements _$MarkAllReadDataCopyWith<$Res> {
  __$MarkAllReadDataCopyWithImpl(this._self, this._then);

  final _MarkAllReadData _self;
  final $Res Function(_MarkAllReadData) _then;

/// Create a copy of MarkAllReadData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = freezed,}) {
  return _then(_MarkAllReadData(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
