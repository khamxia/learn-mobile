
import 'dart:convert';

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
}