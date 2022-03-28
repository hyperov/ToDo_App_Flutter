import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {

// Create storage
  final storage = const FlutterSecureStorage();

// Read value
  Future<String?> readValue(String key) async {
    String? value = await storage.read(key: key);
    return value;
  }

// Read all values
  Future<Map<String, String>> readAllValues(String key) async {
    Map<String, String> allValues = await storage.readAll();
    return allValues;
  }

// Delete value
  Future<void> deleteValue(String key) async {
     await storage.delete(key: key);
  }

// Delete all
  Future<void> deleteAllValues(String key) async {
    await storage.deleteAll();
  }

// Write value
  Future<void> writeValue(String key,dynamic value) async {
    await storage.write(key: key, value: value);
  }
}