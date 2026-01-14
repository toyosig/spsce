// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_states_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowStatesResponseModel {

 String? get message; bool? get success; List<FollowStates>? get data; int? get total; int? get page; int? get limit; int? get totalPages;
/// Create a copy of FollowStatesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowStatesResponseModelCopyWith<FollowStatesResponseModel> get copyWith => _$FollowStatesResponseModelCopyWithImpl<FollowStatesResponseModel>(this as FollowStatesResponseModel, _$identity);

  /// Serializes this FollowStatesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowStatesResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success,const DeepCollectionEquality().hash(data),total,page,limit,totalPages);

@override
String toString() {
  return 'FollowStatesResponseModel(message: $message, success: $success, data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $FollowStatesResponseModelCopyWith<$Res>  {
  factory $FollowStatesResponseModelCopyWith(FollowStatesResponseModel value, $Res Function(FollowStatesResponseModel) _then) = _$FollowStatesResponseModelCopyWithImpl;
@useResult
$Res call({
 String? message, bool? success, List<FollowStates>? data, int? total, int? page, int? limit, int? totalPages
});




}
/// @nodoc
class _$FollowStatesResponseModelCopyWithImpl<$Res>
    implements $FollowStatesResponseModelCopyWith<$Res> {
  _$FollowStatesResponseModelCopyWithImpl(this._self, this._then);

  final FollowStatesResponseModel _self;
  final $Res Function(FollowStatesResponseModel) _then;

/// Create a copy of FollowStatesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? success = freezed,Object? data = freezed,Object? total = freezed,Object? page = freezed,Object? limit = freezed,Object? totalPages = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FollowStates>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FollowStatesResponseModel implements FollowStatesResponseModel {
  const _FollowStatesResponseModel({this.message, this.success, final  List<FollowStates>? data, this.total, this.page, this.limit, this.totalPages}): _data = data;
  factory _FollowStatesResponseModel.fromJson(Map<String, dynamic> json) => _$FollowStatesResponseModelFromJson(json);

@override final  String? message;
@override final  bool? success;
 final  List<FollowStates>? _data;
@override List<FollowStates>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? total;
@override final  int? page;
@override final  int? limit;
@override final  int? totalPages;

/// Create a copy of FollowStatesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowStatesResponseModelCopyWith<_FollowStatesResponseModel> get copyWith => __$FollowStatesResponseModelCopyWithImpl<_FollowStatesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowStatesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowStatesResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success,const DeepCollectionEquality().hash(_data),total,page,limit,totalPages);

@override
String toString() {
  return 'FollowStatesResponseModel(message: $message, success: $success, data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$FollowStatesResponseModelCopyWith<$Res> implements $FollowStatesResponseModelCopyWith<$Res> {
  factory _$FollowStatesResponseModelCopyWith(_FollowStatesResponseModel value, $Res Function(_FollowStatesResponseModel) _then) = __$FollowStatesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? message, bool? success, List<FollowStates>? data, int? total, int? page, int? limit, int? totalPages
});




}
/// @nodoc
class __$FollowStatesResponseModelCopyWithImpl<$Res>
    implements _$FollowStatesResponseModelCopyWith<$Res> {
  __$FollowStatesResponseModelCopyWithImpl(this._self, this._then);

  final _FollowStatesResponseModel _self;
  final $Res Function(_FollowStatesResponseModel) _then;

/// Create a copy of FollowStatesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? success = freezed,Object? data = freezed,Object? total = freezed,Object? page = freezed,Object? limit = freezed,Object? totalPages = freezed,}) {
  return _then(_FollowStatesResponseModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FollowStates>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
