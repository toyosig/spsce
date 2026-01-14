// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BalanceDataModel _$BalanceDataModelFromJson(Map<String, dynamic> json) =>
    _BalanceDataModel(
      availableBalance: (json['availableBalance'] as num?)?.toDouble(),
      pendingBalance: (json['pendingBalance'] as num?)?.toDouble(),
      totalBalance: (json['totalBalance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BalanceDataModelToJson(_BalanceDataModel instance) =>
    <String, dynamic>{
      'availableBalance': instance.availableBalance,
      'pendingBalance': instance.pendingBalance,
      'totalBalance': instance.totalBalance,
    };
