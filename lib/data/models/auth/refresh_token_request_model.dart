class RefreshTokenRequestModel {
  final String refreshToken;

  RefreshTokenRequestModel({required this.refreshToken});

  factory RefreshTokenRequestModel.toJson(Map<String, dynamic> json) {
    return RefreshTokenRequestModel(refreshToken: json['refresh_token']);
  }
}
