
class Product {
  String id;
  String name;
  String description;
  double buyPrice;
  double sellPrice;
  int quantity;
  String? imagePath;
  Product({required this.id, required this.name, required this.description, required this.buyPrice, required this.sellPrice, required this.quantity, this.imagePath});
  double get stockValue => sellPrice * quantity;
  Map<String, dynamic> toMap() => {'id':id,'name':name,'description':description,'buyPrice':buyPrice,'sellPrice':sellPrice,'quantity':quantity,'imagePath':imagePath};
  factory Product.fromMap(Map<String,dynamic> m)=>Product(id:m['id'],name:m['name']??'',description:m['description']??'',buyPrice:(m['buyPrice']??0).toDouble(),sellPrice:(m['sellPrice']??0).toDouble(),quantity:(m['quantity']??0).toInt(),imagePath:m['imagePath']);
}
