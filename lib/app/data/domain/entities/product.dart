class Product{
  int? id;
  String? name;
  String? details;
  String? photo;
  //double? price;

  Product({this.details,this.id,this.name,this.photo});

   factory Product.fromMap(Map<String, dynamic> json) => Product(
        name: json["name"],
        details: json["description"],
        photo: json["photo"],
    );
}