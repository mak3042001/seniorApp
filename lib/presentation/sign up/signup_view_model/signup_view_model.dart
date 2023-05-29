import 'dart:async';

import 'package:senior/domain/usecase/auth/register_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import 'package:senior/presentation/resources/string_manager.dart';


class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutput {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController phoneStreamController = StreamController<String>.broadcast();
  StreamController birthdateStreamController =
      StreamController<String>.broadcast();
  StreamController nameStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();
  StreamController confirmPasswordStreamController =
      StreamController<String>.broadcast();
  StreamController areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserRegisteredInSuccessfullyStreamController =
  StreamController<bool>();

  final RegisterUseCase _registerUseCase;
  var registerObject = RegisterObject("", "", "", "", "", "");

  RegisterViewModel(this._registerUseCase);

  // inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    userNameStreamController.close();
    phoneStreamController.close();
    birthdateStreamController.close();
    nameStreamController.close();
    passwordStreamController.close();
    confirmPasswordStreamController.close();
    areAllInputsValidStreamController.close();
    isUserRegisteredInSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputName => nameStreamController.sink;

  @override
  Sink get inputPhone => phoneStreamController.sink;

  @override
  Sink get inputBirthdate => birthdateStreamController.sink;

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputConfirmPassword => confirmPasswordStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;

  @override
  Sink get inputAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _registerUseCase.execute(
      RegisterUseCaseInput(
          registerObject.username,
          registerObject.name,
          registerObject.phone,
          registerObject.birthdate,
          registerObject.password,
          registerObject.confirmPassword),
    ))
        .fold(
            (failure) => {
                  // left -> failure
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      // navigate to main screen
      isUserRegisteredInSuccessfullyStreamController.add(true);
    });
  }

  @override
  setUserName(String userName) {
    if (_isUserNameValid(userName)) {
      //  update register view object
      registerObject = registerObject.copyWith(username: userName);
    } else {
      // reset username value in register view object
      registerObject = registerObject.copyWith(username: "");
    }
    validate();
  }

  @override
  setBirthdate(String birthdate) {
    if (_isBirthdateValid(birthdate)) {
      //  update register view object
      registerObject = registerObject.copyWith(birthdate: birthdate);
    } else {
      // reset code value in register view object
      registerObject = registerObject.copyWith(birthdate: "");
    }
    validate();
  }

  @override
  setName(String name) {
    if (_isNameValid(name)) {
      //  update register view object
      registerObject = registerObject.copyWith(name: name);
    } else {
      // reset name value in register view object
      registerObject = registerObject.copyWith(name: "");
    }
    validate();
  }

  @override
  setPhone(String phone) {
    if (_isPhoneValid(phone)) {
      //  update register view object
      registerObject = registerObject.copyWith(phone: phone);
    } else {
      // reset phone value in register view object
      registerObject = registerObject.copyWith(phone: "");
    }
    validate();
  }

  @override
  setPassword(String password) {
    if (_isPasswordValid(password)) {
      //  update register view object
      registerObject = registerObject.copyWith(password: password);
    } else {
      // reset password value in register view object
      registerObject = registerObject.copyWith(password: "");
    }
    validate();
  }

  @override
  setConfirmPassword(String confirmPassword) {
    if (_isConfirmPasswordValid(confirmPassword)) {
      //  update register view object
      registerObject =
          registerObject.copyWith(confirmPassword: confirmPassword);
    } else {
      // reset confirmPassword value in register view object
      registerObject = registerObject.copyWith(confirmPassword: "");
    }
    validate();
  }

  // -- outputs

  @override
  Stream<bool> get outputIsUserNameValid => userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid
      .map((isUserName) => isUserName ? null : StringManager.userNameInvalid);

  @override
  Stream<bool> get outputIsNameValid =>
      nameStreamController.stream.map((name) => _isNameValid(name));

  @override
  Stream<String?> get outputErrorName => outputIsNameValid
      .map((isNameValid) => isNameValid ? null : StringManager.invalidName);

  @override
  Stream<bool> get outputIsPhoneValid =>
      phoneStreamController.stream.map((phone) => _isPhoneValid(phone));

  @override
  Stream<String?> get outputErrorPhone => outputIsPhoneValid
      .map((isPhoneValid) => isPhoneValid ? null : StringManager.phoneInvalid);

  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword => outputIsPasswordValid.map(
      (isPasswordValid) => isPasswordValid ? null : StringManager.passwordInvalid);

  @override
  Stream<bool> get outputIsConfirmPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorConfirmPassword => outputIsConfirmPasswordValid.map(
      (isConfirmPasswordValid) => isConfirmPasswordValid ? null : StringManager.confirmPasswordInvalid);

  @override
  Stream<bool> get outputIsBirthdateValid => birthdateStreamController.stream
      .map((birthdate) => _isBirthdateValid(birthdate));

  @override
  Stream<String?> get outputErrorBirthdate => outputIsBirthdateValid.map(
      (isBirthdateValid) => isBirthdateValid ? null : StringManager.birthdateInvalid);



  @override
  Stream<bool> get outputAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  // --  private functions

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isNameValid(String name) {
    return name.isNotEmpty;
  }

  bool _isPhoneValid(String phone) {
    return phone.length >= 10;
  }

  bool _isBirthdateValid(String birthdate) {
    return birthdate.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool _isConfirmPasswordValid(String confirmPassword) {
    return confirmPassword.length >= 6;
  }

  bool _areAllInputsValid() {
    return registerObject.birthdate.isNotEmpty &&
        registerObject.phone.isNotEmpty &&
        registerObject.username.isNotEmpty &&
        registerObject.name.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.confirmPassword.isNotEmpty;
  }

  validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class RegisterViewModelInput {
  Sink get inputUserName;

  Sink get inputPhone;

  Sink get inputBirthdate;

  Sink get inputName;

  Sink get inputPassword;

  Sink get inputConfirmPassword;

  Sink get inputAllInputsValid;

  register();

  setUserName(String userName);

  setPhone(String phone);

  setBirthdate(String birthdate);

  setName(String name);

  setPassword(String password);

  setConfirmPassword(String confirmPassword);
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsPhoneValid;

  Stream<String?> get outputErrorPhone;

  Stream<bool> get outputIsBirthdateValid;

  Stream<String?> get outputErrorBirthdate;

  Stream<bool> get outputIsNameValid;

  Stream<String?> get outputErrorName;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<bool> get outputIsConfirmPasswordValid;

  Stream<String?> get outputErrorConfirmPassword;

  Stream<bool> get outputAreAllInputsValid;
}
