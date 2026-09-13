import 'package:flutter/material.dart';
import 'package:learn_app/model/sighup_model.dart';
import 'package:learn_app/pages/login/provider/login_state.dart';

class LoginLogic extends ChangeNotifier {
  LoginState _loginState = LoginState.initial();

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
  }) {
    SignUpModel data = SignUpModel(
      email: email,
      password: password,
      fullname: fullname,
      id: id,
    );
    {
      _loginState = loginState.copyWith(signUpModel: data);
    }
  }
}
