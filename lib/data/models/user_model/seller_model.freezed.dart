// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SellerModel {

 String? get id; String? get fullName; DateTime? get dateOfBirth; String? get phoneNumber; String? get streetAddress; String? get city; String? get state; String? get postalCode; String? get bankName; String? get accountNumber; String? get bankVerificationNumber; String? get nationalIdentityNumber; String? get userId; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of SellerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerModelCopyWith<SellerModel> get copyWith => _$SellerModelCopyWithImpl<SellerModel>(this as SellerModel, _$identity);

  /// Serializes this SellerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.bankVerificationNumber, bankVerificationNumber) || other.bankVerificationNumber == bankVerificationNumber)&&(identical(other.nationalIdentityNumber, nationalIdentityNumber) || other.nationalIdentityNumber == nationalIdentityNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,dateOfBirth,phoneNumber,streetAddress,city,state,postalCode,bankName,accountNumber,bankVerificationNumber,nationalIdentityNumber,userId,createdAt,updatedAt);

@override
String toString() {
  return 'SellerModel(id: $id, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, streetAddress: $streetAddress, city: $city, state: $state, postalCode: $postalCode, bankName: $bankName, accountNumber: $accountNumber, bankVerificationNumber: $bankVerificationNumber, nationalIdentityNumber: $nationalIdentityNumber, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SellerModelCopyWith<$Res>  {
  factory $SellerModelCopyWith(SellerModel value, $Res Function(SellerModel) _then) = _$SellerModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? fullName, DateTime? dateOfBirth, String? phoneNumber, String? streetAddress, String? city, String? state, String? postalCode, String? bankName, String? accountNumber, String? bankVerificationNumber, String? nationalIdentityNumber, String? userId, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$SellerModelCopyWithImpl<$Res>
    implements $SellerModelCopyWith<$Res> {
  _$SellerModelCopyWithImpl(this._self, this._then);

  final SellerModel _self;
  final $Res Function(SellerModel) _then;

/// Create a copy of SellerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,Object? dateOfBirth = freezed,Object? phoneNumber = freezed,Object? streetAddress = freezed,Object? city = freezed,Object? state = freezed,Object? postalCode = freezed,Object? bankName = freezed,Object? accountNumber = freezed,Object? bankVerificationNumber = freezed,Object? nationalIdentityNumber = freezed,Object? userId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,streetAddress: freezed == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,bankVerificationNumber: freezed == bankVerificationNumber ? _self.bankVerificationNumber : bankVerificationNumber // ignore: cast_nullable_to_non_nullable
as String?,nationalIdentityNumber: freezed == nationalIdentityNumber ? _self.nationalIdentityNumber : nationalIdentityNumber // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SellerModel implements SellerModel {
  const _SellerModel({this.id, this.fullName, this.dateOfBirth, this.phoneNumber, this.streetAddress, this.city, this.state, this.postalCode, this.bankName, this.accountNumber, this.bankVerificationNumber, this.nationalIdentityNumber, this.userId, this.createdAt, this.updatedAt});
  factory _SellerModel.fromJson(Map<String, dynamic> json) => _$SellerModelFromJson(json);

@override final  String? id;
@override final  String? fullName;
@override final  DateTime? dateOfBirth;
@override final  String? phoneNumber;
@override final  String? streetAddress;
@override final  String? city;
@override final  String? state;
@override final  String? postalCode;
@override final  String? bankName;
@override final  String? accountNumber;
@override final  String? bankVerificationNumber;
@override final  String? nationalIdentityNumber;
@override final  String? userId;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of SellerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerModelCopyWith<_SellerModel> get copyWith => __$SellerModelCopyWithImpl<_SellerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.bankVerificationNumber, bankVerificationNumber) || other.bankVerificationNumber == bankVerificationNumber)&&(identical(other.nationalIdentityNumber, nationalIdentityNumber) || other.nationalIdentityNumber == nationalIdentityNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,dateOfBirth,phoneNumber,streetAddress,city,state,postalCode,bankName,accountNumber,bankVerificationNumber,nationalIdentityNumber,userId,createdAt,updatedAt);

@override
String toString() {
  return 'SellerModel(id: $id, fullName: $fullName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, streetAddress: $streetAddress, city: $city, state: $state, postalCode: $postalCode, bankName: $bankName, accountNumber: $accountNumber, bankVerificationNumber: $bankVerificationNumber, nationalIdentityNumber: $nationalIdentityNumber, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SellerModelCopyWith<$Res> implements $SellerModelCopyWith<$Res> {
  factory _$SellerModelCopyWith(_SellerModel value, $Res Function(_SellerModel) _then) = __$SellerModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? fullName, DateTime? dateOfBirth, String? phoneNumber, String? streetAddress, String? city, String? state, String? postalCode, String? bankName, String? accountNumber, String? bankVerificationNumber, String? nationalIdentityNumber, String? userId, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$SellerModelCopyWithImpl<$Res>
    implements _$SellerModelCopyWith<$Res> {
  __$SellerModelCopyWithImpl(this._self, this._then);

  final _SellerModel _self;
  final $Res Function(_SellerModel) _then;

/// Create a copy of SellerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? dateOfBirth = freezed,Object? phoneNumber = freezed,Object? streetAddress = freezed,Object? city = freezed,Object? state = freezed,Object? postalCode = freezed,Object? bankName = freezed,Object? accountNumber = freezed,Object? bankVerificationNumber = freezed,Object? nationalIdentityNumber = freezed,Object? userId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SellerModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,streetAddress: freezed == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,bankVerificationNumber: freezed == bankVerificationNumber ? _self.bankVerificationNumber : bankVerificationNumber // ignore: cast_nullable_to_non_nullable
as String?,nationalIdentityNumber: freezed == nationalIdentityNumber ? _self.nationalIdentityNumber : nationalIdentityNumber // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
