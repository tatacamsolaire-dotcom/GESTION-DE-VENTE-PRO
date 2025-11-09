
import 'dart:convert'; import 'dart:io'; import 'package:path_provider/path_provider.dart';
class StorageService{
  static const fileName='gvultra_data.json';
  Future<File> _getFile() async {final dir=await getApplicationDocumentsDirectory(); return File('${dir.path}/$fileName');}
  Future<Map<String,dynamic>> readAll() async {try{final f=await _getFile(); if(await f.exists()){return json.decode(await f.readAsString());}}catch(_){ } return {'products':[],'sales':[]};}
  Future<void> writeAll(Map<String,dynamic> d) async {final f=await _getFile(); await f.writeAsString(json.encode(d));}
  Future<void> clearAll() async => writeAll({'products':[],'sales':[]});
}
