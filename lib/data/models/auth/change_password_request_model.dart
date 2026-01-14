class ChangePasswordReqModel {
  final String oldPassword;
  final String newPassword;

  ChangePasswordReqModel({
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }

  @override
  String toString() =>
      'ChangePasswordReqModel(oldPassword: $oldPassword, newPassword: $newPassword)';
}
