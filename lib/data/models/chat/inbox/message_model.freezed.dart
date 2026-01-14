// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageModel {

 String? get id; String? get text; String? get senderId; String? get conversationId; bool? get read; String? get createdAt; AuthUserModel? get sender; String? get offerId; InboxOffers? get offer;
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelCopyWith<MessageModel> get copyWith => _$MessageModelCopyWithImpl<MessageModel>(this as MessageModel, _$identity);

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.read, read) || other.read == read)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.offer, offer) || other.offer == offer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,senderId,conversationId,read,createdAt,sender,offerId,offer);

@override
String toString() {
  return 'MessageModel(id: $id, text: $text, senderId: $senderId, conversationId: $conversationId, read: $read, createdAt: $createdAt, sender: $sender, offerId: $offerId, offer: $offer)';
}


}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res>  {
  factory $MessageModelCopyWith(MessageModel value, $Res Function(MessageModel) _then) = _$MessageModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? text, String? senderId, String? conversationId, bool? read, String? createdAt, AuthUserModel? sender, String? offerId, InboxOffers? offer
});


$AuthUserModelCopyWith<$Res>? get sender;$InboxOffersCopyWith<$Res>? get offer;

}
/// @nodoc
class _$MessageModelCopyWithImpl<$Res>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? text = freezed,Object? senderId = freezed,Object? conversationId = freezed,Object? read = freezed,Object? createdAt = freezed,Object? sender = freezed,Object? offerId = freezed,Object? offer = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,read: freezed == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as InboxOffers?,
  ));
}
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get sender {
    if (_self.sender == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.sender!, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InboxOffersCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $InboxOffersCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MessageModel implements MessageModel {
  const _MessageModel({this.id = '', this.text = '', this.senderId = '', this.conversationId = '', this.read = false, this.createdAt = '', this.sender, this.offerId = '', this.offer});
  factory _MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

@override@JsonKey() final  String? id;
@override@JsonKey() final  String? text;
@override@JsonKey() final  String? senderId;
@override@JsonKey() final  String? conversationId;
@override@JsonKey() final  bool? read;
@override@JsonKey() final  String? createdAt;
@override final  AuthUserModel? sender;
@override@JsonKey() final  String? offerId;
@override final  InboxOffers? offer;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelCopyWith<_MessageModel> get copyWith => __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.read, read) || other.read == read)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.offer, offer) || other.offer == offer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,senderId,conversationId,read,createdAt,sender,offerId,offer);

@override
String toString() {
  return 'MessageModel(id: $id, text: $text, senderId: $senderId, conversationId: $conversationId, read: $read, createdAt: $createdAt, sender: $sender, offerId: $offerId, offer: $offer)';
}


}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res> implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(_MessageModel value, $Res Function(_MessageModel) _then) = __$MessageModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? text, String? senderId, String? conversationId, bool? read, String? createdAt, AuthUserModel? sender, String? offerId, InboxOffers? offer
});


@override $AuthUserModelCopyWith<$Res>? get sender;@override $InboxOffersCopyWith<$Res>? get offer;

}
/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? text = freezed,Object? senderId = freezed,Object? conversationId = freezed,Object? read = freezed,Object? createdAt = freezed,Object? sender = freezed,Object? offerId = freezed,Object? offer = freezed,}) {
  return _then(_MessageModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,read: freezed == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as InboxOffers?,
  ));
}

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get sender {
    if (_self.sender == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.sender!, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InboxOffersCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $InboxOffersCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}

// dart format on
