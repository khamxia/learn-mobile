import 'package:learn_app/constants/path_api.dart';
import 'package:learn_app/models/response_api.dart';

import '../services/services.dart';

class ProductRepository {
  final Services services;
  ProductRepository({required this.services});

  // ດຶງຂໍ້ມູນສິນຄ້າ
  Future<ResponseApi> getProducts({required String token}) async {
    try {
      final response = await services.get(path: PathApi.products, token: token);
      print('response product ::: ${response.data['products']}');
      return ResponseApi(message: 'ດຶງຂໍ້ມູນສິນຄ້າສຳເລັດ', data: response.data);
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }
}
