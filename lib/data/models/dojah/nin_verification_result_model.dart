class NINVerificationResult {
  String? firstName;
  String? lastName;
  String? gender;
  String? middleName;
  String? photo;
  String? dateOfBirth;
  String? email;
  String? phoneNumber;
  String? employmentStatus;
  String? maritalStatus;

  NINVerificationResult({
    this.firstName,
    this.lastName,
    this.gender,
    this.middleName,
    this.photo,
    this.dateOfBirth,
    this.email,
    this.phoneNumber,
    this.employmentStatus,
    this.maritalStatus,
  });

  NINVerificationResult.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    middleName = json['middle_name'];
    photo = json['photo'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    employmentStatus = json['employment_status'];
    maritalStatus = json['marital_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['middle_name'] = middleName;
    data['photo'] = photo;
    data['date_of_birth'] = dateOfBirth;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['employment_status'] = employmentStatus;
    data['marital_status'] = maritalStatus;
    return data;
  }
}
