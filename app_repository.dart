
import 'package:uuid/uuid.dart'; import 'models/product.dart'; import 'models/sale.dart'; import 'services/storage_service.dart';
class AppRepository{ final storage=StorageService(); final _uuid=const Uuid(); List<Product> products=[]; List<Sale> sales=[];
  Future<void> load() async {final d=await storage.readAll(); products=(d['products'] as List).map((e)=>Product.fromMap(e)).toList(); sales=(d['sales'] as List).map((e)=>Sale.fromMap(e)).toList();}
  Future<void> _persist() async {await storage.writeAll({'products':products.map((e)=>e.toMap()).toList(),'sales':sales.map((e)=>e.toMap()).toList()});}
  Future<void> addOrUpdateProduct(Product p) async {final i=products.indexWhere((e)=>e.id==p.id); if(i==-1) products.add(p); else products[i]=p; await _persist();}
  Future<void> deleteAllProducts() async {products.clear(); await _persist();}
  Future<Sale> createSale({required Product product, required int quantity, required String city, required String clientName, required String clientPhone, required DateTime date}) async {
    final sale=Sale(id:_uuid.v4(), productId: product.id, productName: product.name, quantity: quantity, unitPrice: product.sellPrice, totalPrice: product.sellPrice*quantity, clientCity: city, clientName: clientName, clientPhone: clientPhone, date: date); sales.add(sale); product.quantity-=quantity; await _persist(); return sale;}
}
