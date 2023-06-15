import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/di.dart';
import 'package:senior/app/static.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {

  final ImagePicker _imagePicker = instance<ImagePicker>();

  final AppPreference _appPreference = instance<AppPreference>();
  DateTime selectedDate = DateTime.now();

  ProfileScreen({Key? key}) : super(key: key);
  TextEditingController userNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      const Text(
                        "Name",
                        style: TextStyle(
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
                          const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/no_user.png",
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
                      controller: userNameController,
                      type: TextInputType.none,
                      text: "Mohamed Ahmed",
                      prefix: IconBroken.Profile,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defaultDisableFormField(
                      enableInteractiveSelection: false,
                      hasFocusBool: false,
                      controller: dateController,
                      type: TextInputType.none,
                      onTap: null,
                      text: dateController.text != null
                          ? "30/4/2001"
                          : dateController.text,
                      prefix: IconBroken.Calendar,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defaultDisableFormField(
                      enableInteractiveSelection: false,
                      hasFocusBool: false,
                      controller: phoneController,
                      onTap: null,
                      type: TextInputType.none,
                      text: "01149718874",
                      prefix: IconBroken.Call,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defaultDisableFormField(
                      enableInteractiveSelection: false,
                      hasFocusBool: false,
                      controller: mailController,
                      onTap: null,
                      type: TextInputType.none,
                      text: "mak3042001@gmail.com",
                      prefix: IconBroken.Message,
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
                        text: "Password",
                        prefix: IconBroken.Lock,
                        suffix: IconBroken.Edit,
                        suffixPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: 'Rest Password',
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                defaultFormField(
                                  controller: currentPasswordController,
                                  type: TextInputType.text,
                                  text: "Current Password",
                                  prefix: IconBroken.Password,
                                  isPassword: false,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultFormField(
                                  controller: newPasswordController,
                                  type: TextInputType.text,
                                  text: "New Password",
                                  prefix: IconBroken.Password,
                                  isPassword: false,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultFormField(
                                  controller: confirmNewPasswordController,
                                  type: TextInputType.text,
                                  text: "Confirm New Password",
                                  prefix: IconBroken.Password,
                                  isPassword: false,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                            btnOkText: "UPDATE PASSWORD",
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
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
                      title: 'Edit Profile',
                      body: Column(
                        children: [
                          defaultFormField(
                            prefix: IconBroken.Profile,
                            controller: userNameController,
                            type: TextInputType.text,
                            text: "UserName",
                            isPassword: false,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultFormField(
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
                            text: "Birthday",
                            isPassword: false,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultFormField(
                            prefix: IconBroken.Call,
                            controller: phoneController,
                            type: TextInputType.text,
                            text: "Phone Number",
                            isPassword: false,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultFormField(
                            prefix: IconBroken.Message,
                            controller: mailController,
                            type: TextInputType.text,
                            text: "E-mail",
                            isPassword: false,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                      btnOkText: "EDIT PROFILE",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
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
                          "Edit Profile",
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
              SizedBox(
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
                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.error), // Set the desired color here
                    ),
                      onPressed: (){
                        _appPreference.setUserLoggedOut();
                        Navigator.pushReplacementNamed(context, Routes.loginRoute);
                      },
                      child: const Text(StringManager.logout),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                    title: Text(StringManager.photoGallery),
                    onTap: () {
                      _imageFromGallery();
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    trailing: const Icon(Icons.arrow_forward),
                    leading: const Icon(Icons.camera_alt_outlined),
                    title: Text(StringManager.photoCamera),
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
    // _viewModel.setProfilePicture(File(image?.path ?? ""));
  }

  _imageFromCamera() async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    // _viewModel.setProfilePicture(File(image?.path ?? ""));
  }
}
