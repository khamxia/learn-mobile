// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    final int id;
    final String fullname;
    final String email;
    final String password;

    SignUpModel({
        required this.id,
        required this.fullname,
        required this.email,
        required this.password,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "password": password,
    };
}
