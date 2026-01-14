// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_seller_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddSellerResponseModel {

 int? get statusCode; bool? get success; String? get error; String? get message; AddSellerData? get data;
/// Create a copy of AddSellerResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddSellerResponseModelCopyWith<AddSellerResponseModel> get copyWith => _$AddSellerResponseModelCopyWithImpl<AddSellerResponseModel>(this as AddSellerResponseModel, _$identity);

  /// Serializes this AddSellerResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddSellerResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,error,message,data);

@override
String toString() {
  return 'AddSellerResponseModel(statusCode: $statusCode, success: $success, error: $error, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $AddSellerResponseModelCopyWith<$Res>  {
  factory $AddSellerResponseModelCopyWith(AddSellerResponseModel value, $Res Function(AddSellerResponseModel) _then) = _$AddSellerResponseModelCopyWithImpl;
@useResult
$Res call({
 int? statusCode, bool? success, String? error, String? message, AddSellerData? data
});


$AddSellerDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$AddSellerResponseModelCopyWithImpl<$Res>
    implements $AddSellerResponseModelCopyWith<$Res> {
  _$AddSellerResponseModelCopyWithImpl(this._self, this._then);

  final AddSellerResponseModel _self;
  final $Res Function(AddSellerResponseModel) _then;

/// Create a copy of AddSellerResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = freezed,Object? success = freezed,Object? error = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AddSellerData?,
  ));
}
/// Create a copy of AddSellerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddSellerDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AddSellerDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AddSellerResponseModel implements AddSellerResponseModel {
  const _AddSellerResponseModel({this.statusCode, this.success, this.error, this.message, this.data});
  factory _AddSellerResponseModel.fromJson(Map<String, dynamic> json) => _$AddSellerResponseModelFromJson(json);

@override final  int? statusCode;
@override final  bool? success;
@override final  String? error;
@override final  String? message;
@override final  AddSellerData? data;

/// Create a copy of AddSellerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddSellerResponseModelCopyWith<_AddSellerResponseModel> get copyWith => __$AddSellerResponseModelCopyWithImpl<_AddSellerResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddSellerResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddSellerResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,error,message,data);

@override
String toString() {
  return 'AddSellerResponseModel(statusCode: $statusCode, success: $success, error: $error, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AddSellerResponseModelCopyWith<$Res> implements $AddSellerResponseModelCopyWith<$Res> {
  factory _$AddSellerResponseModelCopyWith(_AddSellerResponseModel value, $Res Function(_AddSellerResponseModel) _then) = __$AddSellerResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? statusCode, bool? success, String? error, String? message, AddSellerData? data
});


@override $AddSellerDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$AddSellerResponseModelCopyWithImpl<$Res>
    implements _$AddSellerResponseModelCopyWith<$Res> {
  __$AddSellerResponseModelCopyWithImpl(this._self, this._then);

  final _AddSellerResponseModel _self;
  final $Res Function(_AddSellerResponseModel) _then;

/// Create a copy of AddSellerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? success = freezed,Object? error = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_AddSellerResponseModel(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AddSellerData?,
  ));
}

/// Create a copy of AddSellerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddSellerDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AddSellerDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AddSellerData {

 String? get id; String? get fullName; DateTime? get dateOfBirth; String? get phoneNumber; String? get streetAddress; String? get city; String? get state; String? get postalCode; String? get bankVerificationNumber; String? get nationalIdentityNumber; String? get bankName; double? get availableBalance; double? get pendingBalance; String? get accountNumber; String? get userId; DateTime? get createdAt; DateTime? get updatedAt; AuthUserModel? get user;
/// Create a copy of AddSellerData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddSellerDataCopyWith<AddSellerData> get copyWith => _$AddSellerDataCopyWithImpl<AddSellerData>(this as AddSellerData, _$identity);

  /// Serializes this AddSellerData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddSellerData&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.bankVerificationNumber, bankVerificationNumber) || other.bankVerificationNumber == bankVerificationNumber)&&(identical(other.nationalIdentityNumber, nationalIdentityNumber) || other.nationalIdentityNumber == nationalIdentityNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.pendingBalance, pendingBalance) || other.pendingBalance == pendingBalance)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,dateOfBirth,phoneNumber,streetAddress,city,state,postalCode,bankVerificationNumber,nationalIdentityNumber,bankName,availableBalance,pendingBalance,accountNumber,userId,createdAt,updatedAt,user);

@override
String toString() {
  return 'AddSellerData(id: $id, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, streetAddress: $streetAddress, city: $city, state: $state, postalCode: $postalCode, bankVerificationNumber: $bankVerificationNumber, nationalIdentityNumber: $nationalIdentityNumber, bankName: $bankName, availableBalance: $availableBalance, pendingBalance: $pendingBalance, accountNumber: $accountNumber, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $AddSellerDataCopyWith<$Res>  {
  factory $AddSellerDataCopyWith(AddSellerData value, $Res Function(AddSellerData) _then) = _$AddSellerDataCopyWithImpl;
@useResult
$Res call({
 String? id, String? fullName, DateTime? dateOfBirth, String? phoneNumber, String? streetAddress, String? city, String? state, String? postalCode, String? bankVerificationNumber, String? nationalIdentityNumber, String? bankName, double? availableBalance, double? pendingBalance, String? accountNumber, String? userId, DateTime? createdAt, DateTime? updatedAt, AuthUserModel? user
});


$AuthUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$AddSellerDataCopyWithImpl<$Res>
    implements $AddSellerDataCopyWith<$Res> {
  _$AddSellerDataCopyWithImpl(this._self, this._then);

  final AddSellerData _self;
  final $Res Function(AddSellerData) _then;

/// Create a copy of AddSellerData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,Object? dateOfBirth = freezed,Object? phoneNumber = freezed,Object? streetAddress = freezed,Object? city = freezed,Object? state = freezed,Object? postalCode = freezed,Object? bankVerificationNumber = freezed,Object? nationalIdentityNumber = freezed,Object? bankName = freezed,Object? availableBalance = freezed,Object? pendingBalance = freezed,Object? accountNumber = freezed,Object? userId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,streetAddress: freezed == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,bankVerificationNumber: freezed == bankVerificationNumber ? _self.bankVerificationNumber : bankVerificationNumber // ignore: cast_nullable_to_non_nullable
as String?,nationalIdentityNumber: freezed == nationalIdentityNumber ? _self.nationalIdentityNumber : nationalIdentityNumber // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,availableBalance: freezed == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double?,pendingBalance: freezed == pendingBalance ? _self.pendingBalance : pendingBalance // ignore: cast_nullable_to_non_nullable
as double?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,
  ));
}
/// Create a copy of AddSellerData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AddSellerData implements AddSellerData {
  const _AddSellerData({this.id, this.fullName, this.dateOfBirth, this.phoneNumber, this.streetAddress, this.city, this.state, this.postalCode, this.bankVerificationNumber, this.nationalIdentityNumber, this.bankName, this.availableBalance, this.pendingBalance, this.accountNumber, this.userId, this.createdAt, this.updatedAt, this.user});
  factory _AddSellerData.fromJson(Map<String, dynamic> json) => _$AddSellerDataFromJson(json);

@override final  String? id;
@override final  String? fullName;
@override final  DateTime? dateOfBirth;
@override final  String? phoneNumber;
@override final  String? streetAddress;
@override final  String? city;
@override final  String? state;
@override final  String? postalCode;
@override final  String? bankVerificationNumber;
@override final  String? nationalIdentityNumber;
@override final  String? bankName;
@override final  double? availableBalance;
@override final  double? pendingBalance;
@override final  String? accountNumber;
@override final  String? userId;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  AuthUserModel? user;

/// Create a copy of AddSellerData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddSellerDataCopyWith<_AddSellerData> get copyWith => __$AddSellerDataCopyWithImpl<_AddSellerData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddSellerDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddSellerData&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.bankVerificationNumber, bankVerificationNumber) || other.bankVerificationNumber == bankVerificationNumber)&&(identical(other.nationalIdentityNumber, nationalIdentityNumber) || other.nationalIdentityNumber == nationalIdentityNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.pendingBalance, pendingBalance) || other.pendingBalance == pendingBalance)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,dateOfBirth,phoneNumber,streetAddress,city,state,postalCode,bankVerificationNumber,nationalIdentityNumber,bankName,availableBalance,pendingBalance,accountNumber,userId,createdAt,updatedAt,user);

@override
String toString() {
  return 'AddSellerData(id: $id, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, streetAddress: $streetAddress, city: $city, state: $state, postalCode: $postalCode, bankVerificationNumber: $bankVerificationNumber, nationalIdentityNumber: $nationalIdentityNumber, bankName: $bankName, availableBalance: $availableBalance, pendingBalance: $pendingBalance, accountNumber: $accountNumber, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AddSellerDataCopyWith<$Res> implements $AddSellerDataCopyWith<$Res> {
  factory _$AddSellerDataCopyWith(_AddSellerData value, $Res Function(_AddSellerData) _then) = __$AddSellerDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? fullName, DateTime? dateOfBirth, String? phoneNumber, String? streetAddress, String? city, String? state, String? postalCode, String? bankVerificationNumber, String? nationalIdentityNumber, String? bankName, double? availableBalance, double? pendingBalance, String? accountNumber, String? userId, DateTime? createdAt, DateTime? updatedAt, AuthUserModel? user
});


@override $AuthUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$AddSellerDataCopyWithImpl<$Res>
    implements _$AddSellerDataCopyWith<$Res> {
  __$AddSellerDataCopyWithImpl(this._self, this._then);

  final _AddSellerData _self;
  final $Res Function(_AddSellerData) _then;

/// Create a copy of AddSellerData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? dateOfBirth = freezed,Object? phoneNumber = freezed,Object? streetAddress = freezed,Object? city = freezed,Object? state = freezed,Object? postalCode = freezed,Object? bankVerificationNumber = freezed,Object? nationalIdentityNumber = freezed,Object? bankName = freezed,Object? availableBalance = freezed,Object? pendingBalance = freezed,Object? accountNumber = freezed,Object? userId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? user = freezed,}) {
  return _then(_AddSellerData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,streetAddress: freezed == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,bankVerificationNumber: freezed == bankVerificationNumber ? _self.bankVerificationNumber : bankVerificationNumber // ignore: cast_nullable_to_non_nullable
as String?,nationalIdentityNumber: freezed == nationalIdentityNumber ? _self.nationalIdentityNumber : nationalIdentityNumber // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,availableBalance: freezed == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double?,pendingBalance: freezed == pendingBalance ? _self.pendingBalance : pendingBalance // ignore: cast_nullable_to_non_nullable
as double?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,
  ));
}

/// Create a copy of AddSellerData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
