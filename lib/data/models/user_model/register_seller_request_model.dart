class RegisterSellerRequestModel {
  final String fullName;
  final String dateOfBirth;
  final String phoneNumber;
  final String streetAddress;
  final String city;
  final String state;
  final String bankName;
  final String accountNumber;
  final String bankVerificationNumber;
  final String nationalIdentityNumber;

  RegisterSellerRequestModel({
    required this.fullName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.streetAddress,
    required this.city,
    required this.state,
   // this.postalCode,
    required this.bankName,
    required this.accountNumber,
    required this.bankVerificationNumber,
    required this.nationalIdentityNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'streetAddress': streetAddress,
      'city': city,
      'state': state,
      //'postalCode': postalCode,
      'bankName': bankName,
      'accountNumber': accountNumber,
      'bankVerificationNumber': bankVerificationNumber,
      'nationalIdentityNumber': nationalIdentityNumber
    };
  }
}
