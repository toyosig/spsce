// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_suggestions_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchSuggestionsResponseModel {

 bool get success; List<String> get suggestions;
/// Create a copy of SearchSuggestionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSuggestionsResponseModelCopyWith<SearchSuggestionsResponseModel> get copyWith => _$SearchSuggestionsResponseModelCopyWithImpl<SearchSuggestionsResponseModel>(this as SearchSuggestionsResponseModel, _$identity);

  /// Serializes this SearchSuggestionsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSuggestionsResponseModel&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.suggestions, suggestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(suggestions));

@override
String toString() {
  return 'SearchSuggestionsResponseModel(success: $success, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class $SearchSuggestionsResponseModelCopyWith<$Res>  {
  factory $SearchSuggestionsResponseModelCopyWith(SearchSuggestionsResponseModel value, $Res Function(SearchSuggestionsResponseModel) _then) = _$SearchSuggestionsResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, List<String> suggestions
});




}
/// @nodoc
class _$SearchSuggestionsResponseModelCopyWithImpl<$Res>
    implements $SearchSuggestionsResponseModelCopyWith<$Res> {
  _$SearchSuggestionsResponseModelCopyWithImpl(this._self, this._then);

  final SearchSuggestionsResponseModel _self;
  final $Res Function(SearchSuggestionsResponseModel) _then;

/// Create a copy of SearchSuggestionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? suggestions = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SearchSuggestionsResponseModel implements SearchSuggestionsResponseModel {
  const _SearchSuggestionsResponseModel({required this.success, required final  List<String> suggestions}): _suggestions = suggestions;
  factory _SearchSuggestionsResponseModel.fromJson(Map<String, dynamic> json) => _$SearchSuggestionsResponseModelFromJson(json);

@override final  bool success;
 final  List<String> _suggestions;
@override List<String> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}


/// Create a copy of SearchSuggestionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSuggestionsResponseModelCopyWith<_SearchSuggestionsResponseModel> get copyWith => __$SearchSuggestionsResponseModelCopyWithImpl<_SearchSuggestionsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSuggestionsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSuggestionsResponseModel&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_suggestions));

@override
String toString() {
  return 'SearchSuggestionsResponseModel(success: $success, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class _$SearchSuggestionsResponseModelCopyWith<$Res> implements $SearchSuggestionsResponseModelCopyWith<$Res> {
  factory _$SearchSuggestionsResponseModelCopyWith(_SearchSuggestionsResponseModel value, $Res Function(_SearchSuggestionsResponseModel) _then) = __$SearchSuggestionsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<String> suggestions
});




}
/// @nodoc
class __$SearchSuggestionsResponseModelCopyWithImpl<$Res>
    implements _$SearchSuggestionsResponseModelCopyWith<$Res> {
  __$SearchSuggestionsResponseModelCopyWithImpl(this._self, this._then);

  final _SearchSuggestionsResponseModel _self;
  final $Res Function(_SearchSuggestionsResponseModel) _then;

/// Create a copy of SearchSuggestionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? suggestions = null,}) {
  return _then(_SearchSuggestionsResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
