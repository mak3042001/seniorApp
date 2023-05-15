import 'dart:async';
import 'package:senior/domain/usecase/login_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';


class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _allStreamController =
      StreamController<void>.broadcast();

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  var loginObject = LoginObject("", "");

  @override
  void dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
    _allStreamController.close();
  }

  @override
  void start() {}

  //inPut
  @override
  getEmail(String email) {
    emailIn.add(email);
    loginObject = loginObject.copyWith(email: email);
    inAreAllInputsValid.add(null);
  }

  @override
  getPassword(String password) {
    passwordIn.add(password);
    loginObject = loginObject.copyWith(password: password);
    inAreAllInputsValid.add(null);
  }

  @override
  login() async {
    (await _loginUseCase
            .execute(LoginFunction(loginObject.email, loginObject.password)))
        .fold(
      (failure) => {
        print(failure.message),
      },
      (data) => {
        print(data.data?.user?.email),
      },
    );
  }

  @override
  Sink get emailIn => _emailStreamController.sink;

  @override
  Sink get passwordIn => _passwordStreamController.sink;

  @override
  Sink get inAreAllInputsValid => _allStreamController.sink;

  //outPut
  @override
  Stream<bool> get isEmailValid =>
      _emailStreamController.stream.map((email) => _emailStream(email));

  @override
  Stream<bool> get isPasswordValid => _passwordStreamController.stream
      .map((password) => _passwordStream(password));

  @override
  Stream<bool> get outAreAllInputsValid => _allStreamController.stream.map((_) => _allInputsStream());

  bool _emailStream(String email) {
    return email.isNotEmpty;
  }

  bool _passwordStream(String password) {
    return password.isNotEmpty;
  }

  bool _allInputsStream() {
    return _emailStream(loginObject.email) && _passwordStream(loginObject.password);
  }

}

abstract class LoginViewModelInput {
  getEmail(String email);

  getPassword(String password);

  login();

  Sink get emailIn;

  Sink get passwordIn;

  Sink get inAreAllInputsValid;
}

abstract class LoginViewModelOutput {
  Stream<bool> get isEmailValid;

  Stream<bool> get isPasswordValid;

  Stream<bool> get outAreAllInputsValid;
}
