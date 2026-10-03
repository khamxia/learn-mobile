import 'package:learn_app/constants/path_api.dart';
import 'package:learn_app/models/response_api.dart';
import '../services/services.dart';

class AuthenRepository {
  final Services services;
  AuthenRepository({required this.services});

  // ການເຂົ້າລະບົບ
  Future<ResponseApi> login({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> data = {'username': username, 'password': password};
    try {
      final response = await services.post(path: PathApi.login, data: data);
      print('path ==>${PathApi.login}');
      print("response : ${response}");
      return ResponseApi(message: "ເຂົ້າສູ່ລະບົບສຳເລັດ", data: response.data);
    } catch (e) {
      print("error : ${e.toString()}");
      return ResponseApi(message: e.toString(), success: false, data: null);
    }
  }
}
