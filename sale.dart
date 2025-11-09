
class Sale {
  String id; String productId; String productName; int quantity;
  double unitPrice; double totalPrice; String clientCity; String clientName; String clientPhone; DateTime date;
  Sale({required this.id,required this.productId,required this.productName,required this.quantity,required this.unitPrice,required this.totalPrice,required this.clientCity,required this.clientName,required this.clientPhone,required this.date});
  Map<String,dynamic> toMap()=>{'id':id,'productId':productId,'productName':productName,'quantity':quantity,'unitPrice':unitPrice,'totalPrice':totalPrice,'clientCity':clientCity,'clientName':clientName,'clientPhone':clientPhone,'date':date.toIso8601String()};
  factory Sale.fromMap(Map<String,dynamic> m)=>Sale(id:m['id'],productId:m['productId'],productName:m['productName'],quantity:(m['quantity']??0).toInt(),unitPrice:(m['unitPrice']??0).toDouble(),totalPrice:(m['totalPrice']??0).toDouble(),clientCity:m['clientCity']??'',clientName:m['clientName']??'',clientPhone:m['clientPhone']??'',date:DateTime.tryParse(m['date']??'')??DateTime.now());
}
