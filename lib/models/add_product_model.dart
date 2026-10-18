// To parse this JSON data, do
//
//     final addProductModel = addProductModelFromJson(jsonString);

import 'dart:convert';

AddProductModel addProductModelFromJson(String str) => AddProductModel.fromJson(json.decode(str));

String addProductModelToJson(AddProductModel data) => json.encode(data.toJson());

class AddProductModel {
    final int? id;
    final double? price;
    final double? discountPercentage;
    final int? stock;
    final String? description;
    final String? brand;

    AddProductModel({
        this.id,
        this.price,
        this.discountPercentage,
        this.stock,
        this.description,
        this.brand,
    });

    factory AddProductModel.fromJson(Map<String, dynamic> json) => AddProductModel(
        id: json["id"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        stock: json["stock"],
        description: json["description"],
        brand: json["brand"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "discountPercentage": discountPercentage,
        "stock": stock,
        "description": description,
        "brand": brand,
    };
}
