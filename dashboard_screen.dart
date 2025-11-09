
import 'package:flutter/material.dart'; import '../models/product.dart';
class DashboardScreen extends StatelessWidget{
  final List<Product> products; final VoidCallback onGoProducts; final VoidCallback onGoSales; final VoidCallback onGoHistory;
  const DashboardScreen({super.key, required this.products, required this.onGoProducts, required this.onGoSales, required this.onGoHistory});
  @override Widget build(BuildContext context){final totalProducts=products.length; final stockTotal=products.fold<int>(0,(p,e)=>p+e.quantity); final stockValue=products.fold<double>(0,(p,e)=>p+(e.sellPrice*e.quantity));
    return SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      Row(children:[Expanded(child:_info('Nombre de produits','$totalProducts')), const SizedBox(width:12), Expanded(child:_info('Stock total','$stockTotal'))]), const SizedBox(height:12),
      _info('Valeur du stock (FCFA)', stockValue.toStringAsFixed(0)), const SizedBox(height:12),
      Row(children:[Expanded(child:ElevatedButton(onPressed:onGoProducts, child: const Text('Gérer produit'))), const SizedBox(width:8), Expanded(child:ElevatedButton(onPressed:onGoSales, child: const Text('Vente'))), const SizedBox(width:8), Expanded(child:ElevatedButton(onPressed:onGoHistory, child: const Text('Historique')))]),
      const SizedBox(height:24), const Center(child: Text('PDG DRAMANE TRAORE', style: TextStyle(color: Colors.black54))),
    ]));}
  Widget _info(String t, String v)=>Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[ Text(t), const SizedBox(height:8), Text(v, style: const TextStyle(fontSize:20, fontWeight: FontWeight.bold)) ]));}
