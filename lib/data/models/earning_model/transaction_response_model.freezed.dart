// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionResponseModel {

 int? get statusCode; bool? get success; String? get message; List<TransactionDataModel>? get data; int? get totalCount; int? get page; int? get limit; int? get totalPages;
/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionResponseModelCopyWith<TransactionResponseModel> get copyWith => _$TransactionResponseModelCopyWithImpl<TransactionResponseModel>(this as TransactionResponseModel, _$identity);

  /// Serializes this TransactionResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,message,const DeepCollectionEquality().hash(data),totalCount,page,limit,totalPages);

@override
String toString() {
  return 'TransactionResponseModel(statusCode: $statusCode, success: $success, message: $message, data: $data, totalCount: $totalCount, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $TransactionResponseModelCopyWith<$Res>  {
  factory $TransactionResponseModelCopyWith(TransactionResponseModel value, $Res Function(TransactionResponseModel) _then) = _$TransactionResponseModelCopyWithImpl;
@useResult
$Res call({
 int? statusCode, bool? success, String? message, List<TransactionDataModel>? data, int? totalCount, int? page, int? limit, int? totalPages
});




}
/// @nodoc
class _$TransactionResponseModelCopyWithImpl<$Res>
    implements $TransactionResponseModelCopyWith<$Res> {
  _$TransactionResponseModelCopyWithImpl(this._self, this._then);

  final TransactionResponseModel _self;
  final $Res Function(TransactionResponseModel) _then;

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = freezed,Object? success = freezed,Object? message = freezed,Object? data = freezed,Object? totalCount = freezed,Object? page = freezed,Object? limit = freezed,Object? totalPages = freezed,}) {
  return _then(_self.copyWith(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TransactionDataModel>?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransactionResponseModel implements TransactionResponseModel {
  const _TransactionResponseModel({this.statusCode, this.success, this.message, final  List<TransactionDataModel>? data, this.totalCount, this.page, this.limit, this.totalPages}): _data = data;
  factory _TransactionResponseModel.fromJson(Map<String, dynamic> json) => _$TransactionResponseModelFromJson(json);

@override final  int? statusCode;
@override final  bool? success;
@override final  String? message;
 final  List<TransactionDataModel>? _data;
@override List<TransactionDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? totalCount;
@override final  int? page;
@override final  int? limit;
@override final  int? totalPages;

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionResponseModelCopyWith<_TransactionResponseModel> get copyWith => __$TransactionResponseModelCopyWithImpl<_TransactionResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,message,const DeepCollectionEquality().hash(_data),totalCount,page,limit,totalPages);

@override
String toString() {
  return 'TransactionResponseModel(statusCode: $statusCode, success: $success, message: $message, data: $data, totalCount: $totalCount, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$TransactionResponseModelCopyWith<$Res> implements $TransactionResponseModelCopyWith<$Res> {
  factory _$TransactionResponseModelCopyWith(_TransactionResponseModel value, $Res Function(_TransactionResponseModel) _then) = __$TransactionResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? statusCode, bool? success, String? message, List<TransactionDataModel>? data, int? totalCount, int? page, int? limit, int? totalPages
});




}
/// @nodoc
class __$TransactionResponseModelCopyWithImpl<$Res>
    implements _$TransactionResponseModelCopyWith<$Res> {
  __$TransactionResponseModelCopyWithImpl(this._self, this._then);

  final _TransactionResponseModel _self;
  final $Res Function(_TransactionResponseModel) _then;

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? success = freezed,Object? message = freezed,Object? data = freezed,Object? totalCount = freezed,Object? page = freezed,Object? limit = freezed,Object? totalPages = freezed,}) {
  return _then(_TransactionResponseModel(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TransactionDataModel>?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$TransactionDataModel {

 String? get id; String? get orderId; String? get userId; String? get type; int? get amount; String? get status;@JsonKey(fromJson: _parseDateTime) DateTime? get createdAt;@JsonKey(fromJson: _parseDateTime) DateTime? get updatedAt; String? get paymentReference;
/// Create a copy of TransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDataModelCopyWith<TransactionDataModel> get copyWith => _$TransactionDataModelCopyWithImpl<TransactionDataModel>(this as TransactionDataModel, _$identity);

  /// Serializes this TransactionDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.paymentReference, paymentReference) || other.paymentReference == paymentReference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,userId,type,amount,status,createdAt,updatedAt,paymentReference);

@override
String toString() {
  return 'TransactionDataModel(id: $id, orderId: $orderId, userId: $userId, type: $type, amount: $amount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, paymentReference: $paymentReference)';
}


}

/// @nodoc
abstract mixin class $TransactionDataModelCopyWith<$Res>  {
  factory $TransactionDataModelCopyWith(TransactionDataModel value, $Res Function(TransactionDataModel) _then) = _$TransactionDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? orderId, String? userId, String? type, int? amount, String? status,@JsonKey(fromJson: _parseDateTime) DateTime? createdAt,@JsonKey(fromJson: _parseDateTime) DateTime? updatedAt, String? paymentReference
});




}
/// @nodoc
class _$TransactionDataModelCopyWithImpl<$Res>
    implements $TransactionDataModelCopyWith<$Res> {
  _$TransactionDataModelCopyWithImpl(this._self, this._then);

  final TransactionDataModel _self;
  final $Res Function(TransactionDataModel) _then;

/// Create a copy of TransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? userId = freezed,Object? type = freezed,Object? amount = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? paymentReference = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paymentReference: freezed == paymentReference ? _self.paymentReference : paymentReference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransactionDataModel implements TransactionDataModel {
  const _TransactionDataModel({this.id, this.orderId, this.userId, this.type, this.amount, this.status, @JsonKey(fromJson: _parseDateTime) this.createdAt, @JsonKey(fromJson: _parseDateTime) this.updatedAt, this.paymentReference});
  factory _TransactionDataModel.fromJson(Map<String, dynamic> json) => _$TransactionDataModelFromJson(json);

@override final  String? id;
@override final  String? orderId;
@override final  String? userId;
@override final  String? type;
@override final  int? amount;
@override final  String? status;
@override@JsonKey(fromJson: _parseDateTime) final  DateTime? createdAt;
@override@JsonKey(fromJson: _parseDateTime) final  DateTime? updatedAt;
@override final  String? paymentReference;

/// Create a copy of TransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDataModelCopyWith<_TransactionDataModel> get copyWith => __$TransactionDataModelCopyWithImpl<_TransactionDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.paymentReference, paymentReference) || other.paymentReference == paymentReference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,userId,type,amount,status,createdAt,updatedAt,paymentReference);

@override
String toString() {
  return 'TransactionDataModel(id: $id, orderId: $orderId, userId: $userId, type: $type, amount: $amount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, paymentReference: $paymentReference)';
}


}

/// @nodoc
abstract mixin class _$TransactionDataModelCopyWith<$Res> implements $TransactionDataModelCopyWith<$Res> {
  factory _$TransactionDataModelCopyWith(_TransactionDataModel value, $Res Function(_TransactionDataModel) _then) = __$TransactionDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? orderId, String? userId, String? type, int? amount, String? status,@JsonKey(fromJson: _parseDateTime) DateTime? createdAt,@JsonKey(fromJson: _parseDateTime) DateTime? updatedAt, String? paymentReference
});




}
/// @nodoc
class __$TransactionDataModelCopyWithImpl<$Res>
    implements _$TransactionDataModelCopyWith<$Res> {
  __$TransactionDataModelCopyWithImpl(this._self, this._then);

  final _TransactionDataModel _self;
  final $Res Function(_TransactionDataModel) _then;

/// Create a copy of TransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? userId = freezed,Object? type = freezed,Object? amount = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? paymentReference = freezed,}) {
  return _then(_TransactionDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paymentReference: freezed == paymentReference ? _self.paymentReference : paymentReference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
