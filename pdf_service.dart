
import 'dart:io'; import 'package:intl/intl.dart'; import 'package:path_provider/path_provider.dart'; import 'package:pdf/widgets.dart' as pw; import 'package:pdf/pdf.dart';
import '../models/sale.dart';
class PdfService{
  Future<File> generateInvoice(Sale s) async {final pdf=pw.Document(); final df=DateFormat('dd/MM/yyyy HH:mm');
    pdf.addPage(pw.Page(pageFormat: PdfPageFormat.a4, build: (_)=>pw.Padding(padding: const pw.EdgeInsets.all(24), child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children:[
      pw.Text('GESTION DE VENTE ULTRA', style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
      pw.Text('Tata CAMM Solaire — "La sécurité sans limites"'), pw.SizedBox(height:16),
      pw.Text('FACTURE', style: pw.TextStyle(fontSize: 18)), pw.SizedBox(height:8),
      pw.Text('Date : ${df.format(s.date)}'), pw.SizedBox(height:12),
      pw.Text('Client : ${s.clientName}  —  ${s.clientCity}  —  ${s.clientPhone}'),
      pw.SizedBox(height:12),
      pw.Table(border: pw.TableBorder.all(), children:[ pw.TableRow(children:[pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text('Produit')), pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text('Qté')), pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text('PU')), pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text('Total')) ]),
      pw.TableRow(children:[pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(s.productName)), pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text('${s.quantity}')), pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(s.unitPrice.toStringAsFixed(0))), pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(s.totalPrice.toStringAsFixed(0))) ]) ]),
      pw.Spacer(), pw.Divider(), pw.Align(alignment: pw.Alignment.centerRight, child: pw.Text('PDG DRAMANE TRAORE')) ]))));
    final dir=await getApplicationDocumentsDirectory(); final file=File('${dir.path}/facture_${DateTime.now().millisecondsSinceEpoch}.pdf'); await file.writeAsBytes(await pdf.save()); return file;}
}
