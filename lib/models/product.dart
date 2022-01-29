class ProductModel {
  double price;
  int id;
  String name, image;
  ProductModel({
    this.name,
    this.image,
    this.price,
    this.id,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json["name"] as String,
        image: json["image"] as String,
        price: json["price"] as double,
        id: json["id"] as int);
  }

}

List<ProductModel> products = [
  ProductModel(id: 1, price: 20, name: 'Grape', image: 'grape.png'),
  ProductModel(id: 2, price: 22, name: 'Honeydew', image: 'honeydew.png'),
  ProductModel(id: 3, price: 15, name: 'Orange', image: 'orange.png'),
  ProductModel(id: 4, price: 25, name: 'Banana', image: 'banana.png'),
];
