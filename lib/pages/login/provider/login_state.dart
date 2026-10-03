import 'package:learn_app/models/signup_model.dart';

import '../../../models/login_model.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState {
  LoginStatus loginStatus;
  bool isShowpassword;
  SignUpModel? signUpModel;
  LoginModel? loginModel;

  LoginState({
    this.loginStatus = LoginStatus.initial,
    this.isShowpassword = false,
    this.signUpModel,
    this.loginModel,
  });

  factory LoginState.initial() =>
      LoginState(loginStatus: LoginStatus.initial, isShowpassword: false);

  LoginState copyWith({
    LoginStatus? loginStatus,
    bool? isShowpassword,
    SignUpModel? signUpModel,
    LoginModel? loginModel,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      isShowpassword: isShowpassword ?? this.isShowpassword,
      signUpModel: signUpModel ?? this.signUpModel,
      loginModel: loginModel ?? this.loginModel
    );
  }
}
