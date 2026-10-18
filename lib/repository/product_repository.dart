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

  Future<ResponseApi> addProduct({
    required String token,
    required String producName,
    String? desc,
    required double price,
    required double discount,
    required int stock,
    required String brand,
  }) async {
    try {
      Map<String, dynamic> bodyRequest = {
        "title": producName,
        "description": desc,
        "price": price,
        "discountPercentage": discount,
        "stock": stock,
        "brand": brand,
      };
      final response = await services.post(
        path: PathApi.addProduct,
        token: token,
        data: bodyRequest,
      );
      print('response product ::: ${response.data['products']}');
      return ResponseApi(message: 'ດຶງຂໍ້ມູນສິນຄ້າສຳເລັດ', data: response.data);
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }
}
