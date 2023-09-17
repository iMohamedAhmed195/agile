import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Create storage



class Secure{
  final storage = const FlutterSecureStorage() ;



 Future<dynamic> secureGetData({required String key}) async {
  String? value = await storage.read(key: key);
  return value.toString();
}

 Future<Map<String, dynamic>> secureGetAllData() async {
  Map<String, String> allValues = await storage.readAll();
  return allValues;
}

 void secureDeleteData({required String key}) async {
  await storage.delete(key: key);
}

 void secureDeleteAllData() async {
  await storage.deleteAll();
}

 void secureWriteData({required String key, dynamic value}) async {
  await storage.write(key: key, value: value);
}}