// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsResponse {

 bool get success; String get message; SettingsData get data;
/// Create a copy of SettingsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsResponseCopyWith<SettingsResponse> get copyWith => _$SettingsResponseCopyWithImpl<SettingsResponse>(this as SettingsResponse, _$identity);

  /// Serializes this SettingsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SettingsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SettingsResponseCopyWith<$Res>  {
  factory $SettingsResponseCopyWith(SettingsResponse value, $Res Function(SettingsResponse) _then) = _$SettingsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, SettingsData data
});


$SettingsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SettingsResponseCopyWithImpl<$Res>
    implements $SettingsResponseCopyWith<$Res> {
  _$SettingsResponseCopyWithImpl(this._self, this._then);

  final SettingsResponse _self;
  final $Res Function(SettingsResponse) _then;

/// Create a copy of SettingsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SettingsData,
  ));
}
/// Create a copy of SettingsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsDataCopyWith<$Res> get data {
  
  return $SettingsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SettingsResponse implements SettingsResponse {
  const _SettingsResponse({required this.success, required this.message, required this.data});
  factory _SettingsResponse.fromJson(Map<String, dynamic> json) => _$SettingsResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  SettingsData data;

/// Create a copy of SettingsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsResponseCopyWith<_SettingsResponse> get copyWith => __$SettingsResponseCopyWithImpl<_SettingsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SettingsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SettingsResponseCopyWith<$Res> implements $SettingsResponseCopyWith<$Res> {
  factory _$SettingsResponseCopyWith(_SettingsResponse value, $Res Function(_SettingsResponse) _then) = __$SettingsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, SettingsData data
});


@override $SettingsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SettingsResponseCopyWithImpl<$Res>
    implements _$SettingsResponseCopyWith<$Res> {
  __$SettingsResponseCopyWithImpl(this._self, this._then);

  final _SettingsResponse _self;
  final $Res Function(_SettingsResponse) _then;

/// Create a copy of SettingsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_SettingsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SettingsData,
  ));
}

/// Create a copy of SettingsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsDataCopyWith<$Res> get data {
  
  return $SettingsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SettingsData {

 String get id; String get flutterwaveKey; String get paystackKey; String get flutterwavePublicKey; String get paystackPublicKey; int get defaultCommissionPercentage; int get buyerSideCommission; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SettingsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsDataCopyWith<SettingsData> get copyWith => _$SettingsDataCopyWithImpl<SettingsData>(this as SettingsData, _$identity);

  /// Serializes this SettingsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsData&&(identical(other.id, id) || other.id == id)&&(identical(other.flutterwaveKey, flutterwaveKey) || other.flutterwaveKey == flutterwaveKey)&&(identical(other.paystackKey, paystackKey) || other.paystackKey == paystackKey)&&(identical(other.flutterwavePublicKey, flutterwavePublicKey) || other.flutterwavePublicKey == flutterwavePublicKey)&&(identical(other.paystackPublicKey, paystackPublicKey) || other.paystackPublicKey == paystackPublicKey)&&(identical(other.defaultCommissionPercentage, defaultCommissionPercentage) || other.defaultCommissionPercentage == defaultCommissionPercentage)&&(identical(other.buyerSideCommission, buyerSideCommission) || other.buyerSideCommission == buyerSideCommission)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flutterwaveKey,paystackKey,flutterwavePublicKey,paystackPublicKey,defaultCommissionPercentage,buyerSideCommission,createdAt,updatedAt);

@override
String toString() {
  return 'SettingsData(id: $id, flutterwaveKey: $flutterwaveKey, paystackKey: $paystackKey, flutterwavePublicKey: $flutterwavePublicKey, paystackPublicKey: $paystackPublicKey, defaultCommissionPercentage: $defaultCommissionPercentage, buyerSideCommission: $buyerSideCommission, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SettingsDataCopyWith<$Res>  {
  factory $SettingsDataCopyWith(SettingsData value, $Res Function(SettingsData) _then) = _$SettingsDataCopyWithImpl;
@useResult
$Res call({
 String id, String flutterwaveKey, String paystackKey, String flutterwavePublicKey, String paystackPublicKey, int defaultCommissionPercentage, int buyerSideCommission, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SettingsDataCopyWithImpl<$Res>
    implements $SettingsDataCopyWith<$Res> {
  _$SettingsDataCopyWithImpl(this._self, this._then);

  final SettingsData _self;
  final $Res Function(SettingsData) _then;

/// Create a copy of SettingsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flutterwaveKey = null,Object? paystackKey = null,Object? flutterwavePublicKey = null,Object? paystackPublicKey = null,Object? defaultCommissionPercentage = null,Object? buyerSideCommission = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,flutterwaveKey: null == flutterwaveKey ? _self.flutterwaveKey : flutterwaveKey // ignore: cast_nullable_to_non_nullable
as String,paystackKey: null == paystackKey ? _self.paystackKey : paystackKey // ignore: cast_nullable_to_non_nullable
as String,flutterwavePublicKey: null == flutterwavePublicKey ? _self.flutterwavePublicKey : flutterwavePublicKey // ignore: cast_nullable_to_non_nullable
as String,paystackPublicKey: null == paystackPublicKey ? _self.paystackPublicKey : paystackPublicKey // ignore: cast_nullable_to_non_nullable
as String,defaultCommissionPercentage: null == defaultCommissionPercentage ? _self.defaultCommissionPercentage : defaultCommissionPercentage // ignore: cast_nullable_to_non_nullable
as int,buyerSideCommission: null == buyerSideCommission ? _self.buyerSideCommission : buyerSideCommission // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SettingsData implements SettingsData {
  const _SettingsData({required this.id, required this.flutterwaveKey, required this.paystackKey, required this.flutterwavePublicKey, required this.paystackPublicKey, required this.defaultCommissionPercentage, required this.buyerSideCommission, required this.createdAt, required this.updatedAt});
  factory _SettingsData.fromJson(Map<String, dynamic> json) => _$SettingsDataFromJson(json);

@override final  String id;
@override final  String flutterwaveKey;
@override final  String paystackKey;
@override final  String flutterwavePublicKey;
@override final  String paystackPublicKey;
@override final  int defaultCommissionPercentage;
@override final  int buyerSideCommission;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SettingsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsDataCopyWith<_SettingsData> get copyWith => __$SettingsDataCopyWithImpl<_SettingsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsData&&(identical(other.id, id) || other.id == id)&&(identical(other.flutterwaveKey, flutterwaveKey) || other.flutterwaveKey == flutterwaveKey)&&(identical(other.paystackKey, paystackKey) || other.paystackKey == paystackKey)&&(identical(other.flutterwavePublicKey, flutterwavePublicKey) || other.flutterwavePublicKey == flutterwavePublicKey)&&(identical(other.paystackPublicKey, paystackPublicKey) || other.paystackPublicKey == paystackPublicKey)&&(identical(other.defaultCommissionPercentage, defaultCommissionPercentage) || other.defaultCommissionPercentage == defaultCommissionPercentage)&&(identical(other.buyerSideCommission, buyerSideCommission) || other.buyerSideCommission == buyerSideCommission)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flutterwaveKey,paystackKey,flutterwavePublicKey,paystackPublicKey,defaultCommissionPercentage,buyerSideCommission,createdAt,updatedAt);

@override
String toString() {
  return 'SettingsData(id: $id, flutterwaveKey: $flutterwaveKey, paystackKey: $paystackKey, flutterwavePublicKey: $flutterwavePublicKey, paystackPublicKey: $paystackPublicKey, defaultCommissionPercentage: $defaultCommissionPercentage, buyerSideCommission: $buyerSideCommission, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SettingsDataCopyWith<$Res> implements $SettingsDataCopyWith<$Res> {
  factory _$SettingsDataCopyWith(_SettingsData value, $Res Function(_SettingsData) _then) = __$SettingsDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String flutterwaveKey, String paystackKey, String flutterwavePublicKey, String paystackPublicKey, int defaultCommissionPercentage, int buyerSideCommission, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SettingsDataCopyWithImpl<$Res>
    implements _$SettingsDataCopyWith<$Res> {
  __$SettingsDataCopyWithImpl(this._self, this._then);

  final _SettingsData _self;
  final $Res Function(_SettingsData) _then;

/// Create a copy of SettingsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flutterwaveKey = null,Object? paystackKey = null,Object? flutterwavePublicKey = null,Object? paystackPublicKey = null,Object? defaultCommissionPercentage = null,Object? buyerSideCommission = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SettingsData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,flutterwaveKey: null == flutterwaveKey ? _self.flutterwaveKey : flutterwaveKey // ignore: cast_nullable_to_non_nullable
as String,paystackKey: null == paystackKey ? _self.paystackKey : paystackKey // ignore: cast_nullable_to_non_nullable
as String,flutterwavePublicKey: null == flutterwavePublicKey ? _self.flutterwavePublicKey : flutterwavePublicKey // ignore: cast_nullable_to_non_nullable
as String,paystackPublicKey: null == paystackPublicKey ? _self.paystackPublicKey : paystackPublicKey // ignore: cast_nullable_to_non_nullable
as String,defaultCommissionPercentage: null == defaultCommissionPercentage ? _self.defaultCommissionPercentage : defaultCommissionPercentage // ignore: cast_nullable_to_non_nullable
as int,buyerSideCommission: null == buyerSideCommission ? _self.buyerSideCommission : buyerSideCommission // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
