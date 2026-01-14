class EditProfileRequest {
  final String userName;
  final String? profilePic;
  final String? bio;
  final String? location;


  EditProfileRequest({
    required this.userName,
    this.profilePic,
    this.bio,
    this.location
  });
}
