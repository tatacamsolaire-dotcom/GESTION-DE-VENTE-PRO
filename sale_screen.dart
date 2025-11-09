
import 'package:flutter/material.dart'; import 'package:intl/intl.dart';
import '../models/product.dart'; import '../services/pdf_service.dart'; import '../services/storage_service.dart';
class SaleScreen extends StatefulWidget{ final List<Product> products; final void Function(Product,int,String,String,String,DateTime) onSale; final VoidCallback onHome; const SaleScreen({super.key, required this.products, required this.onSale, required this.onHome}); @override State<SaleScreen> createState()=>_State();}
class _State extends State<SaleScreen>{ final formKey=GlobalKey<FormState>(); Product? product; final qty=TextEditingController(text:'1'); final city=TextEditingController(); final name=TextEditingController(); final phone=TextEditingController(); DateTime date=DateTime.now(); final df=DateFormat('dd/MM/yyyy');
  @override Widget build(BuildContext context){return SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[ const Text('Vente / Facturation', style: TextStyle(fontWeight: FontWeight.bold, fontSize:16)), const SizedBox(height:8),
    Form(key: formKey, child: Column(children:[ DropdownButtonFormField<Product>(decoration: const InputDecoration(labelText:'Produit'), items: widget.products.map((p)=>DropdownMenuItem(value:p, child: Text(p.name))).toList(), onChanged: (v)=>setState(()=>product=v), validator:(v)=>v==null?'Choisir un produit':null), const SizedBox(height:8),
      TextFormField(controller: qty, decoration: const InputDecoration(labelText:'Quantité'), keyboardType: TextInputType.number), const SizedBox(height:8),
      TextFormField(controller: city, decoration: const InputDecoration(labelText:'Ville du client')), const SizedBox(height:8),
      TextFormField(controller: name, decoration: const InputDecoration(labelText:'Nom du client')), const SizedBox(height:8),
      TextFormField(controller: phone, decoration: const InputDecoration(labelText:'Numéro du client')), const SizedBox(height:8),
      Row(children:[ Expanded(child: Text('Date: ${df.format(date)}')), IconButton(onPressed: () async {final d=await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2020), lastDate: DateTime(2100)); if(d!=null) setState(()=>date=d);}, icon: const Icon(Icons.calendar_today)) ]),
      const SizedBox(height:12),
      Row(children:[ ElevatedButton(onPressed: () async { if(!formKey.currentState!.validate()) return; final q=int.tryParse(qty.text)??1; if(product==null) return; if(q<=0 || q>product!.quantity){ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Quantité invalide ou supérieure au stock.'))); return;} widget.onSale(product!, q, city.text, name.text, phone.text, date); }, child: const Text('Enregistrer & Facturer')), const SizedBox(width:8), OutlinedButton(onPressed: widget.onHome, child: const Text('Accueil')) ]) ])), ]));}
}
