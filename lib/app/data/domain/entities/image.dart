class Image {
  int? id;
  String? imageName;

  Image({this.id,this.imageName});

  factory Image.fromMap(json) => Image(
    id: json['id'],
    imageName: json['imageName']
  );
    
  

}