// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BalanceDataModel {

 double? get availableBalance; double? get pendingBalance; double? get totalBalance;
/// Create a copy of BalanceDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BalanceDataModelCopyWith<BalanceDataModel> get copyWith => _$BalanceDataModelCopyWithImpl<BalanceDataModel>(this as BalanceDataModel, _$identity);

  /// Serializes this BalanceDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BalanceDataModel&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.pendingBalance, pendingBalance) || other.pendingBalance == pendingBalance)&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,availableBalance,pendingBalance,totalBalance);

@override
String toString() {
  return 'BalanceDataModel(availableBalance: $availableBalance, pendingBalance: $pendingBalance, totalBalance: $totalBalance)';
}


}

/// @nodoc
abstract mixin class $BalanceDataModelCopyWith<$Res>  {
  factory $BalanceDataModelCopyWith(BalanceDataModel value, $Res Function(BalanceDataModel) _then) = _$BalanceDataModelCopyWithImpl;
@useResult
$Res call({
 double? availableBalance, double? pendingBalance, double? totalBalance
});




}
/// @nodoc
class _$BalanceDataModelCopyWithImpl<$Res>
    implements $BalanceDataModelCopyWith<$Res> {
  _$BalanceDataModelCopyWithImpl(this._self, this._then);

  final BalanceDataModel _self;
  final $Res Function(BalanceDataModel) _then;

/// Create a copy of BalanceDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableBalance = freezed,Object? pendingBalance = freezed,Object? totalBalance = freezed,}) {
  return _then(_self.copyWith(
availableBalance: freezed == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double?,pendingBalance: freezed == pendingBalance ? _self.pendingBalance : pendingBalance // ignore: cast_nullable_to_non_nullable
as double?,totalBalance: freezed == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BalanceDataModel implements BalanceDataModel {
  const _BalanceDataModel({this.availableBalance, this.pendingBalance, this.totalBalance});
  factory _BalanceDataModel.fromJson(Map<String, dynamic> json) => _$BalanceDataModelFromJson(json);

@override final  double? availableBalance;
@override final  double? pendingBalance;
@override final  double? totalBalance;

/// Create a copy of BalanceDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BalanceDataModelCopyWith<_BalanceDataModel> get copyWith => __$BalanceDataModelCopyWithImpl<_BalanceDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BalanceDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BalanceDataModel&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.pendingBalance, pendingBalance) || other.pendingBalance == pendingBalance)&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,availableBalance,pendingBalance,totalBalance);

@override
String toString() {
  return 'BalanceDataModel(availableBalance: $availableBalance, pendingBalance: $pendingBalance, totalBalance: $totalBalance)';
}


}

/// @nodoc
abstract mixin class _$BalanceDataModelCopyWith<$Res> implements $BalanceDataModelCopyWith<$Res> {
  factory _$BalanceDataModelCopyWith(_BalanceDataModel value, $Res Function(_BalanceDataModel) _then) = __$BalanceDataModelCopyWithImpl;
@override @useResult
$Res call({
 double? availableBalance, double? pendingBalance, double? totalBalance
});




}
/// @nodoc
class __$BalanceDataModelCopyWithImpl<$Res>
    implements _$BalanceDataModelCopyWith<$Res> {
  __$BalanceDataModelCopyWithImpl(this._self, this._then);

  final _BalanceDataModel _self;
  final $Res Function(_BalanceDataModel) _then;

/// Create a copy of BalanceDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableBalance = freezed,Object? pendingBalance = freezed,Object? totalBalance = freezed,}) {
  return _then(_BalanceDataModel(
availableBalance: freezed == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double?,pendingBalance: freezed == pendingBalance ? _self.pendingBalance : pendingBalance // ignore: cast_nullable_to_non_nullable
as double?,totalBalance: freezed == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
