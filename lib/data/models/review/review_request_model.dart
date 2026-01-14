class ReviewRequestModel {
  final String reviewedUserId;
  final int? rating;
  final String? text;

  ReviewRequestModel({
    required this.reviewedUserId,
    required this.text,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
        "reviewedUserId": reviewedUserId,
        "text": text,
        "rating": rating,
      };
}
