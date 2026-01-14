class AccountVerification {
  String? accountNumber;
  String? accountName;

  AccountVerification({this.accountNumber, this.accountName});

  AccountVerification.fromJson(Map<String, dynamic> json) {
    accountNumber = json['account_number'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    return data;
  }
}
