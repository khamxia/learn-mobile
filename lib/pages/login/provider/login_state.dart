enum LoginStatus { initial, loading, success, error }

class LoginState {
  LoginStatus loginStatus;
  bool isShowpassword;

  LoginState({
    this.loginStatus = LoginStatus.initial,
    this.isShowpassword = false,
  });

  factory LoginState.initial() =>
      LoginState(loginStatus: LoginStatus.initial, isShowpassword: false);

  LoginState copyWith({LoginStatus? loginStatus, bool? isShowpassword}) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      isShowpassword: isShowpassword ?? this.isShowpassword,
    );
  }
}
