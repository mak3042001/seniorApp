import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/auth/update_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import 'package:senior/presentation/resources/string_manager.dart';


class ProfileViewModel extends BaseViewModel
    with ProfileViewModelInput, ProfileViewModelOutput {
  final _profileStreamController = BehaviorSubject<Auth>();

  StreamController userNameStreamController =
  StreamController<String>.broadcast();
  StreamController phoneStreamController = StreamController<String>.broadcast();
  StreamController birthdateStreamController =
  StreamController<String>.broadcast();
  StreamController nameStreamController = StreamController<String>.broadcast();
  StreamController currentPasswordStreamController =
  StreamController<String>.broadcast();
  StreamController passwordStreamController =
  StreamController<String>.broadcast();
  StreamController confirmPasswordStreamController =
  StreamController<String>.broadcast();
  StreamController areAllInputsValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserProfileInSuccessfullyStreamController =
  StreamController<bool>();

  final UpdateUseCase _profileUseCase;
  var profileObject = ProfileObject("", "", "", "", "", "" , "");

  ProfileViewModel(this._profileUseCase);

  // inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _profileStreamController.close();
    userNameStreamController.close();
    phoneStreamController.close();
    birthdateStreamController.close();
    nameStreamController.close();
    currentPasswordStreamController.close();
    passwordStreamController.close();
    confirmPasswordStreamController.close();
    areAllInputsValidStreamController.close();
    isUserProfileInSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputName => nameStreamController.sink;

  @override
  Sink get inputPhone => phoneStreamController.sink;

  @override
  Sink get inputBirthdate => birthdateStreamController.sink;

  @override
  Sink get inputCurrentPassword => currentPasswordStreamController.sink;

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputConfirmPassword => confirmPasswordStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;

  @override
  Sink get inputAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  profile() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _profileUseCase.execute(
      UpdateUseCaseInput(
          profileObject.username,
          profileObject.name,
          profileObject.phone,
          profileObject.birthdate,
      ),
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
      isUserProfileInSuccessfullyStreamController.add(true);
    });
  }

  @override
  setUserName(String userName) {
    if (_isUserNameValid(userName)) {
      //  update profile view object
      profileObject = profileObject.copyWith(username: userName);
    } else {
      // reset username value in profile view object
      profileObject = profileObject.copyWith(username: "");
    }
    validate();
  }

  @override
  setBirthdate(String birthdate) {
    if (_isBirthdateValid(birthdate)) {
      //  update profile view object
      profileObject = profileObject.copyWith(birthdate: birthdate);
    } else {
      // reset code value in profile view object
      profileObject = profileObject.copyWith(birthdate: "");
    }
    validate();
  }

  @override
  setName(String name) {
    if (_isNameValid(name)) {
      //  update profile view object
      profileObject = profileObject.copyWith(name: name);
    } else {
      // reset name value in profile view object
      profileObject = profileObject.copyWith(name: "");
    }
    validate();
  }

  @override
  setPhone(String phone) {
    if (_isPhoneValid(phone)) {
      //  update profile view object
      profileObject = profileObject.copyWith(phone: phone);
    } else {
      // reset phone value in profile view object
      profileObject = profileObject.copyWith(phone: "");
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

  bool _areAllInputsValid() {
    return profileObject.birthdate.isNotEmpty &&
        profileObject.phone.isNotEmpty &&
        profileObject.username.isNotEmpty &&
        profileObject.name.isNotEmpty;
  }

  validate() {
    inputAllInputsValid.add(null);
  }

  @override
  Sink get inputProfile => _profileStreamController.sink;

  @override
  Stream<Auth> get outputProfile => _profileStreamController.stream.map((profile) => profile);
}

abstract class ProfileViewModelInput {
  Sink get inputProfile;

  Sink get inputUserName;

  Sink get inputPhone;

  Sink get inputBirthdate;

  Sink get inputName;

  Sink get inputPassword;

  Sink get inputConfirmPassword;

  Sink get inputAllInputsValid;

  profile();

  setUserName(String userName);

  setPhone(String phone);

  setBirthdate(String birthdate);

  setName(String name);
}

abstract class ProfileViewModelOutput {
  Stream<Auth> get outputProfile;

  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsPhoneValid;

  Stream<String?> get outputErrorPhone;

  Stream<bool> get outputIsBirthdateValid;

  Stream<String?> get outputErrorBirthdate;

  Stream<bool> get outputIsNameValid;

  Stream<String?> get outputErrorName;

  Stream<bool> get outputAreAllInputsValid;
}
