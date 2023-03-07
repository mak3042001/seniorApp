import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senior/contactScreen.dart';
import 'package:senior/loginScreen.dart';
import 'package:senior/static.dart';
import 'package:senior/styles/IconBroken.dart';
import 'package:senior/styles/colors.dart';

class SignUpScreen extends StatelessWidget {

  TextEditingController dateController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 150.0,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                  ))),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/app_img.jpeg.jpg',
                            fit: BoxFit.cover,
                            height: 180.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      textFieldStatic(
                        controller: userNameController,
                          title: 'User Name',
                          iconUse: IconBroken.User,
                          isPassword: false,
                          isEmail: true,
                          isPhone: false,
                          isProfile: false),
                      const SizedBox(
                        height: 20.0,
                      ),
                      textFieldStatic(
                        controller: passwordController,
                          title: 'Password',
                          iconUse: IconBroken.Lock,
                          isPassword: true,
                          isEmail: false,
                          isPhone: false,
                          isProfile: false),
                      const SizedBox(
                        height: 20.0,
                      ),
                      textFieldStatic(
                        controller: phoneController,
                          title: 'Phone',
                          iconUse: IconBroken.Call,
                          isPassword: false,
                          isEmail: false,
                          isPhone: true,
                          isProfile: false),
                      const SizedBox(
                        height: 20.0,
                      ),
                      textFieldStatic(
                        controller: dateController,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          ).then((value)
                          {
                            dateController.text = DateFormat.yMMMd().format(value!);
                          }
                          );
                        },
                        title: dateController.text != null ? 'Birthdate':dateController.text,
                        iconUse: IconBroken.Calendar,
                        isPassword: false,
                        isEmail: false,
                        isPhone: true,
                        isProfile: false,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: 250,
                        child: staticButton(
                            text: 'SIGNUP',
                            colorButton: defaultColor,
                            function: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ContactsScreen()),
                                  (route) => false);
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
