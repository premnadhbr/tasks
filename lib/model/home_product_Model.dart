class BestOffersResponse {
  final String title;
  final List<Product> items;

  BestOffersResponse({required this.title, required this.items});

  factory BestOffersResponse.fromJson(Map<String, dynamic> json) {
    return BestOffersResponse(
      title: json["title"] ?? "",
      items: (json["items"] as List).map((item) => Product.fromJson(item)).toList(),
    );
  }
}

class Product {
  final int productId;
  final String sku;
  final String name;
  final String description;
  final double price;
  final bool inStock;

  Product({
    required this.productId,
    required this.sku,
    required this.name,
    required this.description,
    required this.price,
    required this.inStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json["product_id"] ?? 0,
      sku: json["sku"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      inStock: json["in_stock"] ?? false,
    );
  }
}
