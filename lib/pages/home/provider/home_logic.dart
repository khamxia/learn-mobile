
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learn_app/model/product_model.dart';

class HomeLogic extends ChangeNotifier{

  void update(){

  }
  Future<void>getListProduct()async .async{
    List<Map<String, dynamic>> ListProducts;
    try{
      List<ProductsModel> products = productsModelFromJson(jsonEncode(List));
    }
  }
}