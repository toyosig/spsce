class RegisterRequestModel {
  final String? email;
  final String? password;
  final String? username;
  final String? fullName;
  final String? gender;
  final DateTime? dateOfBirth;
  final String? location;

  RegisterRequestModel({
    this.email,
    this.password,
    this.username,
    this.fullName,
    this.gender,
    this.dateOfBirth,
    this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'fullName': fullName,
      'gender': gender,
      'dateOfBirth': dateOfBirth?.toIso8601String().split('T').first,
      'location': location,
    };
  }

  @override
  String toString() {
    return 'RegisterRequestModel(email: $email, password: ${password != null ? '***' : null}, username: $username, fullName: $fullName, gender: $gender, dateOfBirth: $dateOfBirth, location: $location)';
  }
}
