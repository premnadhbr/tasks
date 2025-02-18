class Category {
  final int categoryId;
  final String categoryName;
  final String? categoryImage;

  Category({
    required this.categoryId,
    required this.categoryName,
    this.categoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      categoryImage: json['category_image'],
    );
  }
}
