class Product{
  int? id;
  String? name;
  String? details;
  String? urlPhoto;
  //double? price;

  Product({this.details,this.id,this.name,this.urlPhoto});

   factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json["name"],
        details: json["details"],
        urlPhoto: json["url_photo"],
    );
}