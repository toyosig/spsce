// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_details_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatDetailData {

 List<MessageModel>? get messages; double? get averageSellerRating;
/// Create a copy of ChatDetailData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDetailDataCopyWith<ChatDetailData> get copyWith => _$ChatDetailDataCopyWithImpl<ChatDetailData>(this as ChatDetailData, _$identity);

  /// Serializes this ChatDetailData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDetailData&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.averageSellerRating, averageSellerRating) || other.averageSellerRating == averageSellerRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),averageSellerRating);

@override
String toString() {
  return 'ChatDetailData(messages: $messages, averageSellerRating: $averageSellerRating)';
}


}

/// @nodoc
abstract mixin class $ChatDetailDataCopyWith<$Res>  {
  factory $ChatDetailDataCopyWith(ChatDetailData value, $Res Function(ChatDetailData) _then) = _$ChatDetailDataCopyWithImpl;
@useResult
$Res call({
 List<MessageModel>? messages, double? averageSellerRating
});




}
/// @nodoc
class _$ChatDetailDataCopyWithImpl<$Res>
    implements $ChatDetailDataCopyWith<$Res> {
  _$ChatDetailDataCopyWithImpl(this._self, this._then);

  final ChatDetailData _self;
  final $Res Function(ChatDetailData) _then;

/// Create a copy of ChatDetailData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = freezed,Object? averageSellerRating = freezed,}) {
  return _then(_self.copyWith(
messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>?,averageSellerRating: freezed == averageSellerRating ? _self.averageSellerRating : averageSellerRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChatDetailData implements ChatDetailData {
  const _ChatDetailData({final  List<MessageModel>? messages, this.averageSellerRating}): _messages = messages;
  factory _ChatDetailData.fromJson(Map<String, dynamic> json) => _$ChatDetailDataFromJson(json);

 final  List<MessageModel>? _messages;
@override List<MessageModel>? get messages {
  final value = _messages;
  if (value == null) return null;
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? averageSellerRating;

/// Create a copy of ChatDetailData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatDetailDataCopyWith<_ChatDetailData> get copyWith => __$ChatDetailDataCopyWithImpl<_ChatDetailData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatDetailDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatDetailData&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.averageSellerRating, averageSellerRating) || other.averageSellerRating == averageSellerRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),averageSellerRating);

@override
String toString() {
  return 'ChatDetailData(messages: $messages, averageSellerRating: $averageSellerRating)';
}


}

/// @nodoc
abstract mixin class _$ChatDetailDataCopyWith<$Res> implements $ChatDetailDataCopyWith<$Res> {
  factory _$ChatDetailDataCopyWith(_ChatDetailData value, $Res Function(_ChatDetailData) _then) = __$ChatDetailDataCopyWithImpl;
@override @useResult
$Res call({
 List<MessageModel>? messages, double? averageSellerRating
});




}
/// @nodoc
class __$ChatDetailDataCopyWithImpl<$Res>
    implements _$ChatDetailDataCopyWith<$Res> {
  __$ChatDetailDataCopyWithImpl(this._self, this._then);

  final _ChatDetailData _self;
  final $Res Function(_ChatDetailData) _then;

/// Create a copy of ChatDetailData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = freezed,Object? averageSellerRating = freezed,}) {
  return _then(_ChatDetailData(
messages: freezed == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>?,averageSellerRating: freezed == averageSellerRating ? _self.averageSellerRating : averageSellerRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
