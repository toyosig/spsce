// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'received_offers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceivedOffersResponse {

 bool get success; String get message; OfferData get data;
/// Create a copy of ReceivedOffersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceivedOffersResponseCopyWith<ReceivedOffersResponse> get copyWith => _$ReceivedOffersResponseCopyWithImpl<ReceivedOffersResponse>(this as ReceivedOffersResponse, _$identity);

  /// Serializes this ReceivedOffersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceivedOffersResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ReceivedOffersResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ReceivedOffersResponseCopyWith<$Res>  {
  factory $ReceivedOffersResponseCopyWith(ReceivedOffersResponse value, $Res Function(ReceivedOffersResponse) _then) = _$ReceivedOffersResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, OfferData data
});


$OfferDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ReceivedOffersResponseCopyWithImpl<$Res>
    implements $ReceivedOffersResponseCopyWith<$Res> {
  _$ReceivedOffersResponseCopyWithImpl(this._self, this._then);

  final ReceivedOffersResponse _self;
  final $Res Function(ReceivedOffersResponse) _then;

/// Create a copy of ReceivedOffersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OfferData,
  ));
}
/// Create a copy of ReceivedOffersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferDataCopyWith<$Res> get data {
  
  return $OfferDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ReceivedOffersResponse implements ReceivedOffersResponse {
  const _ReceivedOffersResponse({required this.success, required this.message, required this.data});
  factory _ReceivedOffersResponse.fromJson(Map<String, dynamic> json) => _$ReceivedOffersResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  OfferData data;

/// Create a copy of ReceivedOffersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceivedOffersResponseCopyWith<_ReceivedOffersResponse> get copyWith => __$ReceivedOffersResponseCopyWithImpl<_ReceivedOffersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceivedOffersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceivedOffersResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ReceivedOffersResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ReceivedOffersResponseCopyWith<$Res> implements $ReceivedOffersResponseCopyWith<$Res> {
  factory _$ReceivedOffersResponseCopyWith(_ReceivedOffersResponse value, $Res Function(_ReceivedOffersResponse) _then) = __$ReceivedOffersResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, OfferData data
});


@override $OfferDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ReceivedOffersResponseCopyWithImpl<$Res>
    implements _$ReceivedOffersResponseCopyWith<$Res> {
  __$ReceivedOffersResponseCopyWithImpl(this._self, this._then);

  final _ReceivedOffersResponse _self;
  final $Res Function(_ReceivedOffersResponse) _then;

/// Create a copy of ReceivedOffersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_ReceivedOffersResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OfferData,
  ));
}

/// Create a copy of ReceivedOffersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferDataCopyWith<$Res> get data {
  
  return $OfferDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$OfferData {

 List<InboxOffers> get offers;
/// Create a copy of OfferData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferDataCopyWith<OfferData> get copyWith => _$OfferDataCopyWithImpl<OfferData>(this as OfferData, _$identity);

  /// Serializes this OfferData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferData&&const DeepCollectionEquality().equals(other.offers, offers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(offers));

@override
String toString() {
  return 'OfferData(offers: $offers)';
}


}

/// @nodoc
abstract mixin class $OfferDataCopyWith<$Res>  {
  factory $OfferDataCopyWith(OfferData value, $Res Function(OfferData) _then) = _$OfferDataCopyWithImpl;
@useResult
$Res call({
 List<InboxOffers> offers
});




}
/// @nodoc
class _$OfferDataCopyWithImpl<$Res>
    implements $OfferDataCopyWith<$Res> {
  _$OfferDataCopyWithImpl(this._self, this._then);

  final OfferData _self;
  final $Res Function(OfferData) _then;

/// Create a copy of OfferData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offers = null,}) {
  return _then(_self.copyWith(
offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<InboxOffers>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OfferData implements OfferData {
  const _OfferData({required final  List<InboxOffers> offers}): _offers = offers;
  factory _OfferData.fromJson(Map<String, dynamic> json) => _$OfferDataFromJson(json);

 final  List<InboxOffers> _offers;
@override List<InboxOffers> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}


/// Create a copy of OfferData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferDataCopyWith<_OfferData> get copyWith => __$OfferDataCopyWithImpl<_OfferData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferData&&const DeepCollectionEquality().equals(other._offers, _offers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers));

@override
String toString() {
  return 'OfferData(offers: $offers)';
}


}

/// @nodoc
abstract mixin class _$OfferDataCopyWith<$Res> implements $OfferDataCopyWith<$Res> {
  factory _$OfferDataCopyWith(_OfferData value, $Res Function(_OfferData) _then) = __$OfferDataCopyWithImpl;
@override @useResult
$Res call({
 List<InboxOffers> offers
});




}
/// @nodoc
class __$OfferDataCopyWithImpl<$Res>
    implements _$OfferDataCopyWith<$Res> {
  __$OfferDataCopyWithImpl(this._self, this._then);

  final _OfferData _self;
  final $Res Function(_OfferData) _then;

/// Create a copy of OfferData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offers = null,}) {
  return _then(_OfferData(
offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<InboxOffers>,
  ));
}


}

// dart format on
