// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sent_offer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SentOffersResponseModel {

 bool? get success; String? get message; SentOfferData? get data;
/// Create a copy of SentOffersResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentOffersResponseModelCopyWith<SentOffersResponseModel> get copyWith => _$SentOffersResponseModelCopyWithImpl<SentOffersResponseModel>(this as SentOffersResponseModel, _$identity);

  /// Serializes this SentOffersResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentOffersResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SentOffersResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SentOffersResponseModelCopyWith<$Res>  {
  factory $SentOffersResponseModelCopyWith(SentOffersResponseModel value, $Res Function(SentOffersResponseModel) _then) = _$SentOffersResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, SentOfferData? data
});


$SentOfferDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$SentOffersResponseModelCopyWithImpl<$Res>
    implements $SentOffersResponseModelCopyWith<$Res> {
  _$SentOffersResponseModelCopyWithImpl(this._self, this._then);

  final SentOffersResponseModel _self;
  final $Res Function(SentOffersResponseModel) _then;

/// Create a copy of SentOffersResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SentOfferData?,
  ));
}
/// Create a copy of SentOffersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SentOfferDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SentOfferDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SentOffersResponseModel implements SentOffersResponseModel {
  const _SentOffersResponseModel({this.success, this.message, this.data});
  factory _SentOffersResponseModel.fromJson(Map<String, dynamic> json) => _$SentOffersResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  SentOfferData? data;

/// Create a copy of SentOffersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SentOffersResponseModelCopyWith<_SentOffersResponseModel> get copyWith => __$SentOffersResponseModelCopyWithImpl<_SentOffersResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SentOffersResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SentOffersResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SentOffersResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SentOffersResponseModelCopyWith<$Res> implements $SentOffersResponseModelCopyWith<$Res> {
  factory _$SentOffersResponseModelCopyWith(_SentOffersResponseModel value, $Res Function(_SentOffersResponseModel) _then) = __$SentOffersResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, SentOfferData? data
});


@override $SentOfferDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$SentOffersResponseModelCopyWithImpl<$Res>
    implements _$SentOffersResponseModelCopyWith<$Res> {
  __$SentOffersResponseModelCopyWithImpl(this._self, this._then);

  final _SentOffersResponseModel _self;
  final $Res Function(_SentOffersResponseModel) _then;

/// Create a copy of SentOffersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_SentOffersResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SentOfferData?,
  ));
}

/// Create a copy of SentOffersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SentOfferDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SentOfferDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SentOfferData {

 List<InboxOffers>? get offers;
/// Create a copy of SentOfferData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentOfferDataCopyWith<SentOfferData> get copyWith => _$SentOfferDataCopyWithImpl<SentOfferData>(this as SentOfferData, _$identity);

  /// Serializes this SentOfferData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentOfferData&&const DeepCollectionEquality().equals(other.offers, offers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(offers));

@override
String toString() {
  return 'SentOfferData(offers: $offers)';
}


}

/// @nodoc
abstract mixin class $SentOfferDataCopyWith<$Res>  {
  factory $SentOfferDataCopyWith(SentOfferData value, $Res Function(SentOfferData) _then) = _$SentOfferDataCopyWithImpl;
@useResult
$Res call({
 List<InboxOffers>? offers
});




}
/// @nodoc
class _$SentOfferDataCopyWithImpl<$Res>
    implements $SentOfferDataCopyWith<$Res> {
  _$SentOfferDataCopyWithImpl(this._self, this._then);

  final SentOfferData _self;
  final $Res Function(SentOfferData) _then;

/// Create a copy of SentOfferData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offers = freezed,}) {
  return _then(_self.copyWith(
offers: freezed == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<InboxOffers>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SentOfferData implements SentOfferData {
  const _SentOfferData({final  List<InboxOffers>? offers}): _offers = offers;
  factory _SentOfferData.fromJson(Map<String, dynamic> json) => _$SentOfferDataFromJson(json);

 final  List<InboxOffers>? _offers;
@override List<InboxOffers>? get offers {
  final value = _offers;
  if (value == null) return null;
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SentOfferData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SentOfferDataCopyWith<_SentOfferData> get copyWith => __$SentOfferDataCopyWithImpl<_SentOfferData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SentOfferDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SentOfferData&&const DeepCollectionEquality().equals(other._offers, _offers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers));

@override
String toString() {
  return 'SentOfferData(offers: $offers)';
}


}

/// @nodoc
abstract mixin class _$SentOfferDataCopyWith<$Res> implements $SentOfferDataCopyWith<$Res> {
  factory _$SentOfferDataCopyWith(_SentOfferData value, $Res Function(_SentOfferData) _then) = __$SentOfferDataCopyWithImpl;
@override @useResult
$Res call({
 List<InboxOffers>? offers
});




}
/// @nodoc
class __$SentOfferDataCopyWithImpl<$Res>
    implements _$SentOfferDataCopyWith<$Res> {
  __$SentOfferDataCopyWithImpl(this._self, this._then);

  final _SentOfferData _self;
  final $Res Function(_SentOfferData) _then;

/// Create a copy of SentOfferData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offers = freezed,}) {
  return _then(_SentOfferData(
offers: freezed == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<InboxOffers>?,
  ));
}


}

// dart format on
