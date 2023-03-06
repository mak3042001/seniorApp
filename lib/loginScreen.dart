import 'package:flutter/material.dart';
import 'package:senior/contactScreen.dart';
import 'package:senior/signUpScreen.dart';
import 'package:senior/static.dart';
import 'package:senior/styles/IconBroken.dart';
import 'package:senior/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ))),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40.0,
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
                        height: 50.0,
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
                        height: 40.0,
                      ),
                      SizedBox(
                        width: 300,
                        child: staticButton(
                            text: 'LOGIN',
                            colorButton: defaultColor,
                            function: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ContactsScreen()),(route) => false,);
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
