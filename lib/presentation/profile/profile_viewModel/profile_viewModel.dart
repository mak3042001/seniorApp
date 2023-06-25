import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/auth/change_image_usecase.dart';
import 'package:senior/domain/usecase/auth/change_password_usecase.dart';
import 'package:senior/domain/usecase/auth/profile_index_usecase.dart';
import 'package:senior/domain/usecase/auth/update_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

class ProfileViewModel extends BaseViewModel
    with ProfileViewModelInput, ProfileViewModelOutput {
  final _profileStreamController = BehaviorSubject<Profile>();
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
  final ProfileIndexUseCase profileIndexUseCase;
  var profileObject = ProfileObject(
    "",
    "",
    "",
    "",
  );
  var passwordObject = PasswordObject(
    "",
    "",
    "",
  );
  var imageObject = ImageObject("");

  ProfileViewModel(this._profileUseCase, this._changePasswordUseCase,
      this._changeImageUseCase, this.profileIndexUseCase);

  // inputs
  @override
  void start() {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await profileIndexUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
      (profile) async {
        inputState.add(ContentState());
        inputProfile.add(profile);
      },
    );
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
    areAllInputsPasswordValidStreamController.close();
    areAllInputsImageValidStreamController.close();
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
        UpdateUseCaseInput(profileObject.name, profileObject.username , profileObject.phone , profileObject.birthdate)))
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

          (){
        start();
      }.call();
    });
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    profileObject = profileObject.copyWith(username: userName);
    inputAllInputsValid.add(null);
  }

  @override
  setBirthdate(String birthdate) {
    inputBirthdate.add(birthdate);
    profileObject = profileObject.copyWith(birthdate: birthdate);
    inputAllInputsValid.add(null);
  }

  @override
  setName(String name) {
    inputName.add(name);
    profileObject = profileObject.copyWith(name: name);
    inputAllInputsValid.add(null);
  }

  @override
  setPhone(String phone) {
    inputPhone.add(phone);
    profileObject = profileObject.copyWith(phone: phone);
    inputAllInputsValid.add(null);
  }

  @override
  setProfilePicture(File profilePicture) {
    inputImage.add(profilePicture);
    imageObject = imageObject.copyWith(image: profilePicture.path);
    inputAllImageInputsValid.add(null);
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
    return phone.isNotEmpty;
  }

  bool _isBirthdateValid(String birthdate) {
    return birthdate.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isNameValid(profileObject.name) &&
        _isUserNameValid(profileObject.username) &&
        _isBirthdateValid(profileObject.birthdate) &&
        _isPhoneValid(profileObject.phone);
  }

  bool _areAllInputsPasswordValid() {
    return _isCurrentPasswordValid(passwordObject.currentPassword) &&
        _isPasswordValid(passwordObject.password) &&
        _isConfirmPasswordValid(passwordObject.confirmPassword);
  }

  bool _areAllInputsImagesValid() {
    return imageObject.image.isNotEmpty;
  }


  @override
  Sink get inputProfile => _profileStreamController.sink;

  @override
  Stream<Profile> get outputProfile =>
      _profileStreamController.stream.map((profile) => profile);

  @override
  changeImage() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _changeImageUseCase.execute(
        ChangeImageUseCaseInput(imageObject.image,)))
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
      isUserImageSuccessfullyStreamController.add(true);

          (){
        start();
      }.call();
    });
  }

  @override
  changePassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _changePasswordUseCase.execute(
        ChangePasswordUseCaseInput(passwordObject.currentPassword, passwordObject.password , passwordObject.confirmPassword)))
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
      isUserPasswordSuccessfullyStreamController.add(true);
          (){
        start();
      }.call();
    });
  }

  @override
  setConfirmPassword(String password) {
    inputConfirmPassword.add(password);
    passwordObject = passwordObject.copyWith(confirmPassword: password);
    inputAllPasswordInputsValid.add(null);
  }

  bool _isConfirmPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  setCurrentPassword(String password) {
    inputCurrentPassword.add(password);
    passwordObject = passwordObject.copyWith(currentPassword: password);
    inputAllPasswordInputsValid.add(null);
  }

  bool _isCurrentPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    passwordObject = passwordObject.copyWith(password: password);
    inputAllPasswordInputsValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  Sink get inputAllImageInputsValid =>
      areAllInputsImageValidStreamController.sink;

  @override
  Sink get inputAllPasswordInputsValid =>
      areAllInputsPasswordValidStreamController.sink;

  @override
  Sink get inputImage => _imageStreamController.sink;

  @override
  Sink get inputNewPassword => passwordStreamController.sink;

  @override
  Stream<bool> get outputAreAllImageInputsValid =>
      areAllInputsImageValidStreamController.stream
          .map((_) => _areAllInputsImagesValid());

  @override
  Stream<bool> get outputAreAllPasswordInputsValid =>
      areAllInputsPasswordValidStreamController.stream
          .map((_) => _areAllInputsPasswordValid());

  @override
  Stream<bool> get outputIsConfirmPasswordValid =>
      confirmPasswordStreamController.stream
          .map((password) => _isConfirmPasswordValid(password));

  @override
  Stream<bool> get outputIsCurrentPasswordValid =>
      currentPasswordStreamController.stream
          .map((password) => _isCurrentPasswordValid(password));

  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsProfileImageValid =>
      profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<ChangePassword> get outputPassword =>
      _passwordStreamController.stream.map((password) => password);
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
  Stream<Profile> get outputProfile;

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
