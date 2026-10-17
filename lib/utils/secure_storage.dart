import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final String _token = 'token';
  final String _username = 'username';
  final String _password = 'password';
  final String _remember = 'remember';
  FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );
  // ຂຽນລົງໄວ້ໃນ Secure Storage
  Future<void> saveToken(String token) async {
    await storage.write(key: _token, value: token);
  }

  Future<void> saveUsername(String username) async{
    await storage.write(key: _username, value: username);
  }

  Future<void> savePassword(String password) async{
    await storage.write(key: _password, value: password);
  }
  Future<void> saveRemember(String remember) async{
    await storage.write(key: _remember, value: remember);
  }


  // ອ່ານຂໍ້ມູນຈາກ Secure Storage
  Future<String?> readToken() async {
    final token = await storage.read(key: _token);
    return token;
  }
  Future<String?> readUsername() async{
    return await storage.read(key: _username);
  }
  Future<String?> readPassword() async{
    return await storage.read(key: _password);
  }

  Future<String?> readRemember() async{
    return await storage.read(key: _remember);
  }

  // ລົບ token ອອກຈາກລະບົບ
  Future<void> clearToken() async{
    return await storage.delete(key: _token);
    // return await storage.deleteAll();
  }
}
