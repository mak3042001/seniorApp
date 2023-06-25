
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/di.dart';
import 'package:senior/app/static.dart';
import 'package:senior/presentation/profile/profile_viewModel/profile_viewModel.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/resources/values_manager.dart';

import '../../../domain/model/model.dart';
import '../../common/state_renderer/state_renderer__impl.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileViewModel _viewModel = instance<ProfileViewModel>();
  final ImagePicker _imagePicker = instance<ImagePicker>();

  final AppPreference _appPreference = instance<AppPreference>();

  DateTime selectedDate = DateTime.now();

  TextEditingController noController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController currentPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  void initState() {
    bind();
    super.initState();
  }

  bind() {
    _viewModel.start();
    nameController
        .addListener(() => _viewModel.setName(nameController.text));

    userNameController
        .addListener(() => _viewModel.setUserName(userNameController.text));

    dateController
        .addListener(() => _viewModel.setBirthdate(dateController.text));

    phoneController
        .addListener(() => _viewModel.setPhone(phoneController.text));

    passwordController
        .addListener(() => _viewModel.setPassword(passwordController.text));

    currentPasswordController.addListener(
        () => _viewModel.setPassword(currentPasswordController.text));

    newPasswordController
        .addListener(() => _viewModel.setPassword(newPasswordController.text));

    confirmNewPasswordController.addListener(
        () => _viewModel.setPassword(confirmNewPasswordController.text));

    _viewModel.isUserProfileInSuccessfullyStreamController.stream
        .listen((isCreate) {
      if (isCreate) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) async {});
      }
    });

    _viewModel.isUserPasswordSuccessfullyStreamController.stream
        .listen((isPassword) {
      if (isPassword) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) async {});
      }
    });

    _viewModel.isUserImageSuccessfullyStreamController.stream
        .listen((isCreate) {
      if (isCreate) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) async {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return Container(
                child: snapshot.data
                        ?.getScreenWidget(context, _getContentWidget(), () {
                      _viewModel.start();
                    }) ??
                    Container(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<Profile>(
      stream: _viewModel.outputProfile,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(Profile? profile) {
    if (profile != null) {
      return Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff3647EC), Color(0xff1E2983)]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0),
                )),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            IconBroken.Arrow___Left_2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 295.0,
                      )
                    ],
                  ),
                  Text(
                    profile.data!.name,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          profile.data!.image,
                        ),
                        radius: 65.0,
                      ),
                      CircleAvatar(
                        backgroundColor: ColorManager.white,
                        child: IconButton(
                          onPressed: () {
                            _showPicker(context);
                          },
                          icon: const Icon(
                            IconBroken.Edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                defaultDisableFormField(
                  enableInteractiveSelection: false,
                  hasFocusBool: false,
                  onTap: null,
                  controller: noController,
                  type: TextInputType.none,
                  text: profile.data!.username,
                  prefix: IconBroken.Profile,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultDisableFormField(
                  enableInteractiveSelection: false,
                  hasFocusBool: false,
                  controller: noController,
                  type: TextInputType.none,
                  onTap: null,
                  text: dateController.text != null
                      ? profile.data!.birthdate
                      : dateController.text,
                  prefix: IconBroken.Calendar,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultDisableFormField(
                  enableInteractiveSelection: false,
                  hasFocusBool: false,
                  controller: noController,
                  onTap: null,
                  type: TextInputType.none,
                  text: profile.data!.phone,
                  prefix: IconBroken.Call,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultDisableFormField(
                    enableInteractiveSelection: false,
                    hasFocusBool: false,
                    controller: passwordController,
                    onTap: null,
                    type: TextInputType.none,
                    text: StringManager.password,
                    prefix: IconBroken.Lock,
                    suffix: IconBroken.Edit,
                    suffixPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.info,
                        animType: AnimType.rightSlide,
                        title: StringManager.resetPassword,
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            StreamBuilder<bool>(
                                stream: _viewModel.outputIsCurrentPasswordValid,
                                builder: (context, snapshot) {
                                  return defaultFormField(
                                    controller: currentPasswordController,
                                    type: TextInputType.text,
                                    text: StringManager.currentPassword,
                                    prefix: IconBroken.Password,
                                    isPassword: false,
                                  );
                                }),
                            const SizedBox(
                              height: 10.0,
                            ),
                            StreamBuilder<bool>(
                                stream: _viewModel.outputIsPasswordValid,
                                builder: (context, snapshot) {
                                  return defaultFormField(
                                    controller: newPasswordController,
                                    type: TextInputType.text,
                                    text: StringManager.newPassword,
                                    prefix: IconBroken.Password,
                                    isPassword: false,
                                  );
                                }),
                            const SizedBox(
                              height: 10.0,
                            ),
                            StreamBuilder<bool>(
                                stream: _viewModel.outputIsConfirmPasswordValid,
                                builder: (context, snapshot) {
                                  return defaultFormField(
                                    controller: confirmNewPasswordController,
                                    type: TextInputType.text,
                                    text: StringManager.confirmPasswordHint,
                                    prefix: IconBroken.Password,
                                    isPassword: false,
                                  );
                                }),
                            const SizedBox(
                              height: AppSize.s28,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p28, right: AppPadding.p28),
                              child: StreamBuilder<bool>(
                                  stream: _viewModel
                                      .outputAreAllPasswordInputsValid,
                                  builder: (context, snapshot) {
                                    return SizedBox(
                                      width: double.infinity,
                                      height: AppSize.s40,
                                      child: ElevatedButton(
                                          onPressed: (snapshot.data ?? false)
                                              ? () {
                                                  _viewModel.changePassword();
                                                  currentPasswordController.text = "";
                                                  newPasswordController.text = "";
                                                  confirmNewPasswordController.text = "";
                                                }
                                              : null,
                                          child: const Text(
                                              StringManager.updatePassword)),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ).show();
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 250,
            child: InkWell(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  title: StringManager.editProfile,
                  body: Column(
                    children: [
                      StreamBuilder<bool>(
                          stream: _viewModel.outputIsNameValid,
                          builder: (context, snapshot) {
                            return defaultFormField(
                              prefix: IconBroken.Profile,
                              controller: nameController,
                              type: TextInputType.text,
                              text: StringManager.nameHint,
                              isPassword: false,
                            );
                          }),
                      const SizedBox(
                        height: 10.0,
                      ),
                      StreamBuilder<bool>(
                          stream: _viewModel.outputIsUserNameValid,
                          builder: (context, snapshot) {
                            return defaultFormField(
                              prefix: IconBroken.User,
                              controller: userNameController,
                              type: TextInputType.text,
                              text: StringManager.username,
                              isPassword: false,
                            );
                          }),
                      const SizedBox(
                        height: 10.0,
                      ),
                      StreamBuilder<bool>(
                          stream: _viewModel.outputIsBirthdateValid,
                          builder: (context, snapshot) {
                            return defaultFormField(
                              prefix: IconBroken.Calendar,
                              controller: dateController,
                              type: TextInputType.datetime,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(1900),
                                  lastDate: selectedDate,
                                ).then((value) {
                                  dateController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              text: StringManager.birthdateHint,
                              isPassword: false,
                            );
                          }),
                      const SizedBox(
                        height: 10.0,
                      ),
                      StreamBuilder<bool>(
                          stream: _viewModel.outputIsPhoneValid,
                          builder: (context, snapshot) {
                            return defaultFormField(
                              prefix: IconBroken.Call,
                              controller: phoneController,
                              type: TextInputType.text,
                              text: StringManager.phoneHint,
                              isPassword: false,
                            );
                          }),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: StreamBuilder<bool>(
                            stream: _viewModel
                                .outputAreAllInputsValid,
                            builder: (context, snapshot) {
                              return SizedBox(
                                width: double.infinity,
                                height: AppSize.s40,
                                child: ElevatedButton(
                                    onPressed: (snapshot.data ?? false)
                                        ? () {
                                      _viewModel.profile();
                                      newPasswordController.text = "";
                                      userNameController.text = "";
                                      dateController.text = "";
                                      phoneController.text = "";
                                    }
                                        : null,
                                    child: const Text(
                                        StringManager.updateProfile)),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ).show();
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Color(0xff3849EF), Color(0xff1F2883)]),
                    borderRadius: BorderRadius.circular(30.0)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      StringManager.editProfile,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.p28, right: AppPadding.p28),
            child: SizedBox(
              width: AppSize.s200,
              height: AppSize.s40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorManager.error), // Set the desired color here
                ),
                onPressed: () {
                  _appPreference.setUserLoggedOut();
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: const Text(StringManager.logout),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera),
                title: const Text(StringManager.photoGallery),
                onTap: () {
                  _imageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text(StringManager.photoCamera),
                onTap: () {
                  _imageFromCamera();
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  _imageFromGallery() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    _viewModel.setProfilePicture(File(image?.path ?? ""));
  }

  _imageFromCamera() async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    _viewModel.setProfilePicture(File(image?.path ?? ""));
  }
}
