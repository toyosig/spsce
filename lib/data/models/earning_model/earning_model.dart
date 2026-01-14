class EarningsModel extends EarningsEntity {
  EarningsModel({
    required super.currentBalance,
    required super.availableForWithdrawal,
    required super.totalEarnings,
  });

  factory EarningsModel.fromJson(Map<String, dynamic> json) {
    return EarningsModel(
      currentBalance: (json['currentBalance'] ?? 0).toDouble(),
      availableForWithdrawal: (json['availableForWithdrawal'] ?? 0).toDouble(),
      totalEarnings: (json['totalEarnings'] ?? 0).toDouble(),
    );
  }

  static List<EarningsModel> fromJsonList(List<dynamic> list) {
    return list.map((item) => EarningsModel.fromJson(item)).toList();
  }
}
class EarningsEntity {
  final double currentBalance;
  final double availableForWithdrawal;
  final double totalEarnings;

  EarningsEntity({
    required this.currentBalance,
    required this.availableForWithdrawal,
    required this.totalEarnings,
  });
}
