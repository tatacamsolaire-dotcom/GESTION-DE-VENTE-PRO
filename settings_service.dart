
import 'package:shared_preferences/shared_preferences.dart';
class SettingsService{
  Future<void> setPin(String? pin) async {final sp=await SharedPreferences.getInstance(); if(pin==null||pin.isEmpty){await sp.remove('pin_code');} else {await sp.setString('pin_code',pin);}}
  Future<String?> getPin() async {final sp=await SharedPreferences.getInstance(); return sp.getString('pin_code');}
  Future<void> setDarkMode(bool v) async {final sp=await SharedPreferences.getInstance(); await sp.setBool('dark_mode',v);}
  Future<bool> getDarkMode() async {final sp=await SharedPreferences.getInstance(); return sp.getBool('dark_mode')??false;}
  Future<void> setThreshold(int v) async {final sp=await SharedPreferences.getInstance(); await sp.setInt('low_stock_threshold',v);}
  Future<int> getThreshold() async {final sp=await SharedPreferences.getInstance(); return sp.getInt('low_stock_threshold')??5;}
}
