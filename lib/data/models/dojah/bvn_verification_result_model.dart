class BVNVerificationResult {
  String? bvn;
  String? firstName;
  String? lastName;
  String? middleName;
  String? gender;
  String? dateOfBirth;
  String? phoneNumber1;
  String? image;
  String? phoneNumber2;

  BVNVerificationResult({
    this.bvn,
    this.firstName,
    this.lastName,
    this.middleName,
    this.gender,
    this.dateOfBirth,
    this.phoneNumber1,
    this.image,
    this.phoneNumber2,
  });

  BVNVerificationResult.fromJson(Map<String, dynamic> json) {
    bvn = json['bvn'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    phoneNumber1 = json['phone_number1'];
    image = json['image'];
    phoneNumber2 = json['phone_number2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bvn'] = bvn;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['middle_name'] = middleName;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['phone_number1'] = phoneNumber1;
    data['image'] = image;
    data['phone_number2'] = phoneNumber2;
    return data;
  }
}
