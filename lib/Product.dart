class Product {
  // Properties of the Product class
  final String barcode;
  final String name;
  final String manufacturer;
  final String category;
  final String imageLink;

  // Constructor for creating a Product instance
  Product({
    required this.barcode,
    required this.name,
    required this.manufacturer,
    required this.category,
    required this.imageLink,
  });

  // Factory method to create a Product instance from JSON data
  factory Product.fromJson(Map<String, dynamic> json) {
    // Create a Product instance and populate its properties from the provided JSON data
    return Product(
      barcode: json['barcode'],
      name: json['name'],
      manufacturer: json['manufacturer'],
      category: json['category'],
      imageLink: json['image_link'],
    );
  }
}
