import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SourceStorge{

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> saveData(String key, String value) async {
    await storage.write(key: key, value: value);
  }
  Future <String?> getData (String key) async{
    return await storage.read(key: key);
  }

}