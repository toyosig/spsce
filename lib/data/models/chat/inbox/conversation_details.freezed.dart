// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationDetails {

 String? get id; String? get participant1Id; String? get participant2Id; String? get createdAt; String? get updatedAt; String? get productId; List<MessageModel>? get messages; int? get unreadCount; MessageModel? get lastMessage;
/// Create a copy of ConversationDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationDetailsCopyWith<ConversationDetails> get copyWith => _$ConversationDetailsCopyWithImpl<ConversationDetails>(this as ConversationDetails, _$identity);

  /// Serializes this ConversationDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.participant1Id, participant1Id) || other.participant1Id == participant1Id)&&(identical(other.participant2Id, participant2Id) || other.participant2Id == participant2Id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.productId, productId) || other.productId == productId)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,participant1Id,participant2Id,createdAt,updatedAt,productId,const DeepCollectionEquality().hash(messages),unreadCount,lastMessage);

@override
String toString() {
  return 'ConversationDetails(id: $id, participant1Id: $participant1Id, participant2Id: $participant2Id, createdAt: $createdAt, updatedAt: $updatedAt, productId: $productId, messages: $messages, unreadCount: $unreadCount, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class $ConversationDetailsCopyWith<$Res>  {
  factory $ConversationDetailsCopyWith(ConversationDetails value, $Res Function(ConversationDetails) _then) = _$ConversationDetailsCopyWithImpl;
@useResult
$Res call({
 String? id, String? participant1Id, String? participant2Id, String? createdAt, String? updatedAt, String? productId, List<MessageModel>? messages, int? unreadCount, MessageModel? lastMessage
});


$MessageModelCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$ConversationDetailsCopyWithImpl<$Res>
    implements $ConversationDetailsCopyWith<$Res> {
  _$ConversationDetailsCopyWithImpl(this._self, this._then);

  final ConversationDetails _self;
  final $Res Function(ConversationDetails) _then;

/// Create a copy of ConversationDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? participant1Id = freezed,Object? participant2Id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? productId = freezed,Object? messages = freezed,Object? unreadCount = freezed,Object? lastMessage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,participant1Id: freezed == participant1Id ? _self.participant1Id : participant1Id // ignore: cast_nullable_to_non_nullable
as String?,participant2Id: freezed == participant2Id ? _self.participant2Id : participant2Id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>?,unreadCount: freezed == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageModel?,
  ));
}
/// Create a copy of ConversationDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageModelCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageModelCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ConversationDetails implements ConversationDetails {
  const _ConversationDetails({this.id = '', this.participant1Id = '', this.participant2Id = '', this.createdAt = '', this.updatedAt = '', this.productId = '', final  List<MessageModel>? messages = const [], this.unreadCount = 0, this.lastMessage}): _messages = messages;
  factory _ConversationDetails.fromJson(Map<String, dynamic> json) => _$ConversationDetailsFromJson(json);

@override@JsonKey() final  String? id;
@override@JsonKey() final  String? participant1Id;
@override@JsonKey() final  String? participant2Id;
@override@JsonKey() final  String? createdAt;
@override@JsonKey() final  String? updatedAt;
@override@JsonKey() final  String? productId;
 final  List<MessageModel>? _messages;
@override@JsonKey() List<MessageModel>? get messages {
  final value = _messages;
  if (value == null) return null;
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  int? unreadCount;
@override final  MessageModel? lastMessage;

/// Create a copy of ConversationDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationDetailsCopyWith<_ConversationDetails> get copyWith => __$ConversationDetailsCopyWithImpl<_ConversationDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.participant1Id, participant1Id) || other.participant1Id == participant1Id)&&(identical(other.participant2Id, participant2Id) || other.participant2Id == participant2Id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.productId, productId) || other.productId == productId)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,participant1Id,participant2Id,createdAt,updatedAt,productId,const DeepCollectionEquality().hash(_messages),unreadCount,lastMessage);

@override
String toString() {
  return 'ConversationDetails(id: $id, participant1Id: $participant1Id, participant2Id: $participant2Id, createdAt: $createdAt, updatedAt: $updatedAt, productId: $productId, messages: $messages, unreadCount: $unreadCount, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class _$ConversationDetailsCopyWith<$Res> implements $ConversationDetailsCopyWith<$Res> {
  factory _$ConversationDetailsCopyWith(_ConversationDetails value, $Res Function(_ConversationDetails) _then) = __$ConversationDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? participant1Id, String? participant2Id, String? createdAt, String? updatedAt, String? productId, List<MessageModel>? messages, int? unreadCount, MessageModel? lastMessage
});


@override $MessageModelCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$ConversationDetailsCopyWithImpl<$Res>
    implements _$ConversationDetailsCopyWith<$Res> {
  __$ConversationDetailsCopyWithImpl(this._self, this._then);

  final _ConversationDetails _self;
  final $Res Function(_ConversationDetails) _then;

/// Create a copy of ConversationDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? participant1Id = freezed,Object? participant2Id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? productId = freezed,Object? messages = freezed,Object? unreadCount = freezed,Object? lastMessage = freezed,}) {
  return _then(_ConversationDetails(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,participant1Id: freezed == participant1Id ? _self.participant1Id : participant1Id // ignore: cast_nullable_to_non_nullable
as String?,participant2Id: freezed == participant2Id ? _self.participant2Id : participant2Id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,messages: freezed == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>?,unreadCount: freezed == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageModel?,
  ));
}

/// Create a copy of ConversationDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageModelCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageModelCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on
