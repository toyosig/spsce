class EditProfileWrapperModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final EditProfileResponseModel? data;

  EditProfileWrapperModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory EditProfileWrapperModel.fromJson(Map<String, dynamic> json) {
    return EditProfileWrapperModel(
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? EditProfileResponseModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }

  @override
  String toString() {
    return 'EditProfileWrapperModel(statusCode: $statusCode, success: $success, message: $message, data: $data)';
  }
}

class EditProfileResponseModel {
  final String? id;
  final String? email;
  final String? username;
  final String? profilePic;
  final String? updatedAt;
  final String? bio;
  final String? location;

  EditProfileResponseModel({
    this.id,
    this.email,
    this.username,
    this.profilePic,
    this.updatedAt,
    this.bio,
    this.location,
  });

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return EditProfileResponseModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      profilePic: json['profilePic'] as String?,
      updatedAt: json['updatedAt'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'profilePic': profilePic,
      'updatedAt': updatedAt,
      'bio': bio,
      'location': location,
    };
  }

  @override
  String toString() {
    return 'EditProfileResponseModel(id: $id, email: $email, username: $username, profilePic: $profilePic, updatedAt: $updatedAt, bio: $bio, location: $location)';
  }
}
