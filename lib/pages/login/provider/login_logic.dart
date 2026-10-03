import 'dart:convert';

import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:learn_app/models/login_model.dart';
import 'package:learn_app/models/signup_model.dart';
>>>>>>> 977a308a12cb8889a4ad007391bb03022d434bf4
import 'package:learn_app/pages/login/provider/login_state.dart';
import 'package:learn_app/repository/authen_repository.dart';
import 'package:learn_app/services/services.dart';
import 'package:learn_app/utils/secure_storage.dart';

import '../../dashboard/dashboard_page.dart';

import '../../../model/signup_model.dart';


class LoginLogic extends ChangeNotifier {
  LoginState _loginState = LoginState.initial();

  AuthenRepository authenRepo = AuthenRepository(services: Services());
  SecureStorage secureStorage = SecureStorage();

  LoginState get loginState => _loginState;

  void changePassword({required bool isShowPassword}) {
    _loginState = loginState.copyWith(isShowpassword: isShowPassword);
    notifyListeners();
  }

  void addUser({
    required int id,
    required String fullname,
    required String email,
    required String password,
  }  ){
    SignUpModel data = SignUpModel(
      email: email,
      fullname: fullname,
      id: id,
<<<<<<< HEAD
      password: password,
    );

=======
    );
>>>>>>> 977a308a12cb8889a4ad007391bb03022d434bf4
    _loginState = loginState.copyWith(signUpModel: data);
  }

  // ເຂົ້າສູ່ລະບົບ API
  Future<void> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    _loginState = loginState.copyWith(loginStatus: LoginStatus.loading);
    try {
      final result = await authenRepo.login(
        username: username,
        password: password,
      );
      if (result.success == true) {
        final loginData = loginModelFromJson(jsonEncode(result.data));
        _loginState = loginState.copyWith(
          loginStatus: LoginStatus.success,
          loginModel: loginData,
        );
        await secureStorage.saveToken(loginData.accessToken ?? "");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
          (route) => false,
        );
      } else {
        // ຖ້າບໍ່ສຳເລັດ
        _loginState = loginState.copyWith(loginStatus: LoginStatus.error);
      }
      notifyListeners();
    } catch (e) {
      print("error logic : ${e.toString()}");
      // ຖ້າບໍ່ສຳເລັດ
      _loginState = loginState.copyWith(loginStatus: LoginStatus.error);
      notifyListeners();
    }
  }
}

  