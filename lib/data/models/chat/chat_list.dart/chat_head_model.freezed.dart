// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_head_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatHeadModel {

@JsonKey(name: 'chat_id') String get chatId; AuthUserModel? get user;@JsonKey(name: 'last_message') String get lastMessage;@JsonKey(name: 'last_message_time') DateTime? get lastMessageTime;@JsonKey(name: 'unread_count') int get unreadCount;@JsonKey(name: 'is_direct') bool? get isDirectChat;
/// Create a copy of ChatHeadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatHeadModelCopyWith<ChatHeadModel> get copyWith => _$ChatHeadModelCopyWithImpl<ChatHeadModel>(this as ChatHeadModel, _$identity);

  /// Serializes this ChatHeadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatHeadModel&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.user, user) || other.user == user)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isDirectChat, isDirectChat) || other.isDirectChat == isDirectChat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,user,lastMessage,lastMessageTime,unreadCount,isDirectChat);

@override
String toString() {
  return 'ChatHeadModel(chatId: $chatId, user: $user, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, unreadCount: $unreadCount, isDirectChat: $isDirectChat)';
}


}

/// @nodoc
abstract mixin class $ChatHeadModelCopyWith<$Res>  {
  factory $ChatHeadModelCopyWith(ChatHeadModel value, $Res Function(ChatHeadModel) _then) = _$ChatHeadModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'chat_id') String chatId, AuthUserModel? user,@JsonKey(name: 'last_message') String lastMessage,@JsonKey(name: 'last_message_time') DateTime? lastMessageTime,@JsonKey(name: 'unread_count') int unreadCount,@JsonKey(name: 'is_direct') bool? isDirectChat
});


$AuthUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ChatHeadModelCopyWithImpl<$Res>
    implements $ChatHeadModelCopyWith<$Res> {
  _$ChatHeadModelCopyWithImpl(this._self, this._then);

  final ChatHeadModel _self;
  final $Res Function(ChatHeadModel) _then;

/// Create a copy of ChatHeadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? user = freezed,Object? lastMessage = null,Object? lastMessageTime = freezed,Object? unreadCount = null,Object? isDirectChat = freezed,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageTime: freezed == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isDirectChat: freezed == isDirectChat ? _self.isDirectChat : isDirectChat // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of ChatHeadModel
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

class _ChatHeadModel implements ChatHeadModel {
  const _ChatHeadModel({@JsonKey(name: 'chat_id') this.chatId = '', this.user, @JsonKey(name: 'last_message') this.lastMessage = '', @JsonKey(name: 'last_message_time') this.lastMessageTime, @JsonKey(name: 'unread_count') this.unreadCount = 0, @JsonKey(name: 'is_direct') this.isDirectChat = false});
  factory _ChatHeadModel.fromJson(Map<String, dynamic> json) => _$ChatHeadModelFromJson(json);

@override@JsonKey(name: 'chat_id') final  String chatId;
@override final  AuthUserModel? user;
@override@JsonKey(name: 'last_message') final  String lastMessage;
@override@JsonKey(name: 'last_message_time') final  DateTime? lastMessageTime;
@override@JsonKey(name: 'unread_count') final  int unreadCount;
@override@JsonKey(name: 'is_direct') final  bool? isDirectChat;

/// Create a copy of ChatHeadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatHeadModelCopyWith<_ChatHeadModel> get copyWith => __$ChatHeadModelCopyWithImpl<_ChatHeadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatHeadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatHeadModel&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.user, user) || other.user == user)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isDirectChat, isDirectChat) || other.isDirectChat == isDirectChat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,user,lastMessage,lastMessageTime,unreadCount,isDirectChat);

@override
String toString() {
  return 'ChatHeadModel(chatId: $chatId, user: $user, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, unreadCount: $unreadCount, isDirectChat: $isDirectChat)';
}


}

/// @nodoc
abstract mixin class _$ChatHeadModelCopyWith<$Res> implements $ChatHeadModelCopyWith<$Res> {
  factory _$ChatHeadModelCopyWith(_ChatHeadModel value, $Res Function(_ChatHeadModel) _then) = __$ChatHeadModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'chat_id') String chatId, AuthUserModel? user,@JsonKey(name: 'last_message') String lastMessage,@JsonKey(name: 'last_message_time') DateTime? lastMessageTime,@JsonKey(name: 'unread_count') int unreadCount,@JsonKey(name: 'is_direct') bool? isDirectChat
});


@override $AuthUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ChatHeadModelCopyWithImpl<$Res>
    implements _$ChatHeadModelCopyWith<$Res> {
  __$ChatHeadModelCopyWithImpl(this._self, this._then);

  final _ChatHeadModel _self;
  final $Res Function(_ChatHeadModel) _then;

/// Create a copy of ChatHeadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? user = freezed,Object? lastMessage = null,Object? lastMessageTime = freezed,Object? unreadCount = null,Object? isDirectChat = freezed,}) {
  return _then(_ChatHeadModel(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageTime: freezed == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isDirectChat: freezed == isDirectChat ? _self.isDirectChat : isDirectChat // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of ChatHeadModel
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
