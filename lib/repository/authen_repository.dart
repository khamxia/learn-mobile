

import 'package:learn_app/models/response_api.dart';
import '../constants/path_api.dart';
import '../services/services.dart';

class AuthenRepository {
  final Services serviceApi;
  AuthenRepository({required this.serviceApi});

  //ການເຂົ້າລະບົບ
  Future<ResponseApi> login({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    try {
      final response = await serviceApi.post(path: PathApi.login, data: data);
      print("response : {$response}");
      return ResponseApi(
        message: "ເຂົ້າສູ່ລະບົບສໍາເລັດ",
        data: response.data,
      );
    } catch (e) {
      print("error : ${e.toString()}");
      return ResponseApi(message: e.toString(), success: false, data: null);
      
    }
  }

  // ດຶງຂໍ້ມູນຜູ້ໃຊ້
  Future<ResponseApi> getUser({required String token}) async {
    try {
      final response = await services.get(path: PathApi.user, token: token);
      // print('response user ==>${response}');
      return ResponseApi(message: "ດຶງຂໍ້ມູນສຳເລັດ", data: response.data);
    } catch (e) {
      print('user error :${e.toString()}');
      return ResponseApi(message: e.toString(), data: null, success: false);
    }
  }

  // Update user info
  Future<ResponseApi> updateUser({
    required String userId,
    required String token,
    required String firstName,
    required String lastName,
    required int age,
  }) async {
    Map<String, dynamic> body = {
      "firstName": firstName,
      "lastName": lastName,
      "age": age,
    };
    try {
      print('path api :::: ${PathApi.updateUser}$userId');
      final response = await services.update(
        path: '${PathApi.updateUser}$userId',
        data: body,
        token: token,
      );
      return ResponseApi(message: 'ອັບເດດສຳເລັດເເລ້ວ', data: response.data);
    } catch (e) {
      return ResponseApi(message: e.toString(), data: null, success: false);
    }
  }
}
