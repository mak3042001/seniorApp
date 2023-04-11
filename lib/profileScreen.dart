import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senior/seniorScreen.dart';
import 'package:senior/static.dart';
import 'styles/IconBroken.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: SafeArea(
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
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SeniorScreen()));
                                  },
                                  icon: const Icon(
                                    IconBroken.Profile,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "Senior",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
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
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/no_user.png",
                        ),
                        radius: 65.0,
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
                    defaultFormField(
                      onTap: null,
                      controller: userNameController,
                      type: TextInputType.none,
                      text: "Mohamed Ahmed",
                      prefix: IconBroken.Profile,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defaultFormField(
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
                    defaultFormField(
                      controller: phoneController,
                      onTap: null,
                      type: TextInputType.none,
                      text: "01149718874",
                      prefix: IconBroken.Call,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defaultFormField(
                      controller: mailController,
                      onTap: null,
                      type: TextInputType.none,
                      text: "mak3042001@gmail.com",
                      prefix: IconBroken.Message,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defaultFormField(
                        controller: passwordController,
                        onTap: null,
                        type: TextInputType.none,
                        text: "Password",
                        prefix: IconBroken.Lock,
                        suffix: IconBroken.Edit,
                        suffixpressed: () {
                          // AwesomeDialog(
                          //   context: context,
                          //   dialogType: DialogType.info,
                          //   animType: AnimType.rightSlide,
                          //   title: 'Rest Password',
                          //   body: Column(
                          //     children: [
                          //       awesomeDialogFormField(
                          //         controller: currentPasswordController,
                          //         type: TextInputType.text,
                          //         text: "Current Password",
                          //       ),
                          //       awesomeDialogFormField(
                          //         controller: newPasswordController,
                          //         type: TextInputType.text,
                          //         text: "New Password",
                          //       ),
                          //       awesomeDialogFormField(
                          //         controller: confirmNewPasswordController,
                          //         type: TextInputType.text,
                          //         text: "Confirm New Password",
                          //       ),
                          //     ],
                          //   ),
                          //   btnOkText: "UPDATE PASSWORD",
                          //   btnCancelOnPress: () {},
                          //   btnOkOnPress: () {},
                          // ).show();
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: 250,
                child: InkWell(
                  onTap: () {
                    // AwesomeDialog(
                    //   context: context,
                    //   dialogType: DialogType.info,
                    //   animType: AnimType.rightSlide,
                    //   title: 'Edit Profile',
                    //   body: Column(
                    //     children: [
                    //       awesomeDialogFormField(
                    //         prefix: IconBroken.Profile,
                    //         controller: userNameController,
                    //         type: TextInputType.text,
                    //         text: "UserName",
                    //       ),
                    //       awesomeDialogFormField(
                    //         prefix: IconBroken.Calendar,
                    //         controller: dateController,
                    //         type: TextInputType.datetime,
                    //         onTap: () {
                    //           showDatePicker(
                    //             context: context,
                    //             initialDate: DateTime.now(),
                    //             firstDate: DateTime.now(),
                    //             lastDate: DateTime(2100),
                    //           ).then((value) {
                    //             dateController.text = DateFormat.yMMMd().format(value!);
                    //           });
                    //         },
                    //         text: "Birthday",
                    //       ),
                    //       awesomeDialogFormField(
                    //         prefix: IconBroken.Call,
                    //         controller: phoneController,
                    //         type: TextInputType.text,
                    //         text: "Phone Number",
                    //       ),
                    //       awesomeDialogFormField(
                    //         prefix: IconBroken.Message,
                    //         controller: mailController,
                    //         type: TextInputType.text,
                    //         text: "E-mail",
                    //       ),
                    //     ],
                    //   ),
                    //   btnOkText: "EDIT PROFILE",
                    //   btnCancelOnPress: () {},
                    //   btnOkOnPress: () {},
                    // ).show();
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
            ],
          ),
        ),
      ),
    );
  }
}
