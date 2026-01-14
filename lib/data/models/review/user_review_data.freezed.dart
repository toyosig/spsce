// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_review_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersReviewData {

 List<ReviewDataModel>? get reviews; int? get averageRating; int? get totalReviews;
/// Create a copy of UsersReviewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersReviewDataCopyWith<UsersReviewData> get copyWith => _$UsersReviewDataCopyWithImpl<UsersReviewData>(this as UsersReviewData, _$identity);

  /// Serializes this UsersReviewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersReviewData&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reviews),averageRating,totalReviews);

@override
String toString() {
  return 'UsersReviewData(reviews: $reviews, averageRating: $averageRating, totalReviews: $totalReviews)';
}


}

/// @nodoc
abstract mixin class $UsersReviewDataCopyWith<$Res>  {
  factory $UsersReviewDataCopyWith(UsersReviewData value, $Res Function(UsersReviewData) _then) = _$UsersReviewDataCopyWithImpl;
@useResult
$Res call({
 List<ReviewDataModel>? reviews, int? averageRating, int? totalReviews
});




}
/// @nodoc
class _$UsersReviewDataCopyWithImpl<$Res>
    implements $UsersReviewDataCopyWith<$Res> {
  _$UsersReviewDataCopyWithImpl(this._self, this._then);

  final UsersReviewData _self;
  final $Res Function(UsersReviewData) _then;

/// Create a copy of UsersReviewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviews = freezed,Object? averageRating = freezed,Object? totalReviews = freezed,}) {
  return _then(_self.copyWith(
reviews: freezed == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewDataModel>?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int?,totalReviews: freezed == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UsersReviewData implements UsersReviewData {
  const _UsersReviewData({final  List<ReviewDataModel>? reviews, this.averageRating, this.totalReviews}): _reviews = reviews;
  factory _UsersReviewData.fromJson(Map<String, dynamic> json) => _$UsersReviewDataFromJson(json);

 final  List<ReviewDataModel>? _reviews;
@override List<ReviewDataModel>? get reviews {
  final value = _reviews;
  if (value == null) return null;
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? averageRating;
@override final  int? totalReviews;

/// Create a copy of UsersReviewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersReviewDataCopyWith<_UsersReviewData> get copyWith => __$UsersReviewDataCopyWithImpl<_UsersReviewData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersReviewDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersReviewData&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reviews),averageRating,totalReviews);

@override
String toString() {
  return 'UsersReviewData(reviews: $reviews, averageRating: $averageRating, totalReviews: $totalReviews)';
}


}

/// @nodoc
abstract mixin class _$UsersReviewDataCopyWith<$Res> implements $UsersReviewDataCopyWith<$Res> {
  factory _$UsersReviewDataCopyWith(_UsersReviewData value, $Res Function(_UsersReviewData) _then) = __$UsersReviewDataCopyWithImpl;
@override @useResult
$Res call({
 List<ReviewDataModel>? reviews, int? averageRating, int? totalReviews
});




}
/// @nodoc
class __$UsersReviewDataCopyWithImpl<$Res>
    implements _$UsersReviewDataCopyWith<$Res> {
  __$UsersReviewDataCopyWithImpl(this._self, this._then);

  final _UsersReviewData _self;
  final $Res Function(_UsersReviewData) _then;

/// Create a copy of UsersReviewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviews = freezed,Object? averageRating = freezed,Object? totalReviews = freezed,}) {
  return _then(_UsersReviewData(
reviews: freezed == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewDataModel>?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int?,totalReviews: freezed == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
