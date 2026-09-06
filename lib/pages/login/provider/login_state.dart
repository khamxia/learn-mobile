enum Loginstatus { initial, loading, success, error }

class Loginstate {
  Loginstatus loginstatus;
  bool isShowPassword;
  LoginState({
    this.loginstatus = Loginstatus.initial,
    this.isShowPassword = false,
  })

  factory LoginState.initial() {
    return LoginState(
      loginstatus: Loginstatus.initial,
      isShowPassword: false,
    );
  }
}
