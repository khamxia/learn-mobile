import 'package:flutter/material.dart';
import 'package:learn_app/pages/login/provider/login_state.dart';

class LoginLogic extends ChangeNotifier {
  LoginState _loginState = LoginState.initial();

  LoginState get loginState => _loginState;

  void changePassword({required bool isShowPassword}) {
    _loginState = loginState.copyWith(isShowpassword: isShowPassword);
    notifyListeners();
  }
}
