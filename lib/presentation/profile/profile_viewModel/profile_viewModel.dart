import 'dart:async';
import 'dart:io';

import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/auth/change_image_usecase.dart';
import 'package:senior/domain/usecase/auth/change_password_usecase.dart';
import 'package:senior/domain/usecase/auth/update_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

class ProfileViewModel extends BaseViewModel
    with ProfileViewModelInput, ProfileViewModelOutput {
  final _profileStreamController = BehaviorSubject<Auth>();
  final _passwordStreamController = BehaviorSubject<ChangePassword>();
  final _imageStreamController = BehaviorSubject<ChangeImage>();

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
  StreamController profilePictureStreamController =
  StreamController<File>.broadcast();
  StreamController areAllInputsValidStreamController =
  StreamController<void>.broadcast();

  StreamController areAllInputsPasswordValidStreamController =
  StreamController<void>.broadcast();

  StreamController areAllInputsImageValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserProfileInSuccessfullyStreamController =
  StreamController<bool>();

  StreamController isUserPasswordSuccessfullyStreamController =
  StreamController<bool>();

  StreamController isUserImageSuccessfullyStreamController =
  StreamController<bool>();

  final UpdateUseCase _profileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final ChangeImageUseCase _changeImageUseCase;
  var profileObject = ProfileObject("", "", "", "",);
  var passwordObject = PasswordObject("", "", "",);
  var imageObject = ImageObject("");

  ProfileViewModel(this._profileUseCase , this._changePasswordUseCase , this._changeImageUseCase);

  // inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _passwordStreamController.close();
    _imageStreamController.close();
    profilePictureStreamController.close();
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
    isUserPasswordSuccessfullyStreamController.close();
    isUserImageSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputProfilePicture => profilePictureStreamController.sink;

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

  @override
  setProfilePicture(File profilePicture) {
    inputProfilePicture.add(profilePicture);
    if (profilePicture.path.isNotEmpty) {
      //  update register view object
      imageObject =
          imageObject.copyWith(image: profilePicture.path);
    } else {
      // reset profilePicture value in register view object
      imageObject = imageObject.copyWith(image: "");
    }
    validate();
  }

  // -- outputs

  @override
  Stream<bool> get outputIsUserNameValid => userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsNameValid =>
      nameStreamController.stream.map((name) => _isNameValid(name));

  @override
  Stream<bool> get outputIsPhoneValid =>
      phoneStreamController.stream.map((phone) => _isPhoneValid(phone));

  @override
  Stream<bool> get outputIsBirthdateValid => birthdateStreamController.stream
      .map((birthdate) => _isBirthdateValid(birthdate));

  @override
  Stream<File> get outputProfilePicture =>
      profilePictureStreamController.stream.map((file) => file);


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

  bool _areAllInputsPasswordValid() {
    return passwordObject.password.isNotEmpty && passwordObject.confirmPassword.isNotEmpty && passwordObject.currentPassword.isNotEmpty;
  }

  bool _areAllInputsImagesValid() {
    return imageObject.image.isNotEmpty;
  }

  validate() {
    inputAllInputsValid.add(null);
  }

  passwordValidate() {
    inputAllPasswordInputsValid.add(null);
  }

  imageValidate() {
    inputAllImageInputsValid.add(null);
  }

  @override
  Sink get inputProfile => _profileStreamController.sink;

  @override
  Stream<Auth> get outputProfile => _profileStreamController.stream.map((profile) => profile);

  @override
  changeImage() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _changeImageUseCase.execute(
      ChangeImageUseCaseInput(
        imageObject.image,
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
  changePassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _changePasswordUseCase.execute(
      ChangePasswordUseCaseInput(
       passwordObject.currentPassword,
       passwordObject.password,
       passwordObject.confirmPassword,
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
  setConfirmPassword(String password) {
    if (_isConfirmPasswordValid(password)) {
      //  update profile view object
      passwordObject = passwordObject.copyWith(confirmPassword: password);
    } else {
      // reset phone value in profile view object
      passwordObject = passwordObject.copyWith(confirmPassword: "");
    }
    passwordValidate();
  }

  bool _isConfirmPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  setCurrentPassword(String password) {
    if (_isCurrentPasswordValid(password)) {
      //  update profile view object
      passwordObject = passwordObject.copyWith(currentPassword: password);
    } else {
      // reset phone value in profile view object
      passwordObject = passwordObject.copyWith(currentPassword: "");
    }
    passwordValidate();
  }

  bool _isCurrentPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  setPassword(String password) {
    if (_isPasswordValid(password)) {
      //  update profile view object
      passwordObject = passwordObject.copyWith(password: password);
    } else {
      // reset phone value in profile view object
      passwordObject = passwordObject.copyWith(password: "");
    }
    passwordValidate();
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  Sink get inputAllImageInputsValid => areAllInputsImageValidStreamController.sink;

  @override
  Sink get inputAllPasswordInputsValid => areAllInputsPasswordValidStreamController.sink;

  @override
  Sink get inputImage => _imageStreamController.sink;

  @override
  Sink get inputNewPassword => passwordStreamController.sink;

  @override
  Stream<bool> get outputAreAllImageInputsValid => areAllInputsImageValidStreamController.stream.map((_) => _areAllInputsImagesValid());

  @override
  Stream<bool> get outputAreAllPasswordInputsValid => areAllInputsPasswordValidStreamController.stream.map((_) => _areAllInputsPasswordValid());


  @override
  Stream<bool> get outputIsConfirmPasswordValid => confirmPasswordStreamController.stream.map((password) => _isConfirmPasswordValid(password));

  @override
  Stream<bool> get outputIsCurrentPasswordValid => currentPasswordStreamController.stream.map((password) => _isCurrentPasswordValid(password));

  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsProfileImageValid => profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<ChangePassword> get outputPassword => _passwordStreamController.stream.map((password) => password);
}

abstract class ProfileViewModelInput {
  Sink get inputProfilePicture;

  Sink get inputProfile;
  Sink get inputPassword;
  Sink get inputImage;

  Sink get inputUserName;

  Sink get inputPhone;

  Sink get inputBirthdate;

  Sink get inputName;

  Sink get inputNewPassword;

  Sink get inputConfirmPassword;

  Sink get inputCurrentPassword;

  Sink get inputAllInputsValid;

  Sink get inputAllPasswordInputsValid;

  Sink get inputAllImageInputsValid;

  profile();
  changeImage();
  changePassword();

  setUserName(String userName);

  setPhone(String phone);

  setBirthdate(String birthdate);

  setName(String name);

  setProfilePicture(File profilePicture);

  setCurrentPassword(String password);
  setPassword(String password);
  setConfirmPassword(String password);
}

abstract class ProfileViewModelOutput {
  Stream<Auth> get outputProfile;
  Stream<ChangePassword> get outputPassword;

  Stream<File> get outputProfilePicture;

  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPhoneValid;

  Stream<bool> get outputIsBirthdateValid;

  Stream<bool> get outputIsNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsCurrentPasswordValid;

  Stream<bool> get outputIsConfirmPasswordValid;

  Stream<bool> get outputIsProfileImageValid;

  Stream<bool> get outputAreAllInputsValid;
  Stream<bool> get outputAreAllPasswordInputsValid;
  Stream<bool> get outputAreAllImageInputsValid;
}
