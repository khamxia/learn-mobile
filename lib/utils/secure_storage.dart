
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final String _token = 'token';
  FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  Future<void> saveToken(String token) async {
    await storage.write(key: _token, value: token);
  }

  Future<String?> readToken() async {
    final token = await storage.read(key: _token);
    return token;
  }

}