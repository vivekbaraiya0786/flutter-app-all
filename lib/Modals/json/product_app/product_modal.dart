class ProductModal {
  List<ProductsDatum> productsData;

  ProductModal({
    required this.productsData,
  });

  factory ProductModal.fromJson({required Map json}) => ProductModal(
        productsData: List<ProductsDatum>.from(
            json["ProductsData"].map((x) => ProductsDatum.fromJson(json: x))),
      );

  Map<String, dynamic> toJson() => {
        "ProductsData": List<dynamic>.from(productsData.map((x) => x.toJson())),
      };
}

class ProductsDatum {
  String id;
  String? category;
  String? name;
  String? image;
  String? price;
  String? ratings;

  ProductsDatum({
    required this.id,
    this.category,
    this.name,
    this.image,
    this.price,
    this.ratings,
  });

  factory ProductsDatum.fromJson({required Map json}) => ProductsDatum(
        id: json["Id"],
        category: json["Category"],
        name: json["Name"],
        image: json["Image"],
        price: json["Price"],
        ratings: json["Ratings"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Category": category,
        "Name": name,
        "Image": image,
        "Price": price,
        "Ratings": ratings,
      };
}
