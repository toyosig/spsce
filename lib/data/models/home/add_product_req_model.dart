class AddProductRequestModel {
  final List<String> photos;
  final String video;
  final String title;
  final String description;
  final List<String> tags;
  final double price;
  final String? categoryId;
  final String? subCategoryId;
  final String condition;
  final List<String> size;
  final String color;
  final String shippingFromId;
  final int quantity;
  final String shippingTo;
  final String brandId;
  final bool isDraft;

  AddProductRequestModel({
    required this.photos,
    required this.video,
    required this.title,
    required this.description,
    required this.tags,
    required this.price,
    this.categoryId,
    this.subCategoryId,
    required this.condition,
    required this.size,
    required this.color,
    required this.shippingFromId,
    required this.quantity,
    required this.shippingTo,
    required this.brandId,
    required this.isDraft,
  });
}
