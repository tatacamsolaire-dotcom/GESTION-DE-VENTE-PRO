
import 'package:flutter/material.dart';
class HistoryScreen extends StatelessWidget{ final VoidCallback onHome; const HistoryScreen({super.key, required this.onHome});
  @override Widget build(BuildContext context){ return SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[ const Text('Historique des ventes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const SizedBox(height:12), Container(height:200, decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12))), const SizedBox(height:12), OutlinedButton(onPressed: onHome, child: const Text('Accueil')), ])); }
}
