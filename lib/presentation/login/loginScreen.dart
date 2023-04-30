import 'package:flutter/material.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/colors.dart';
import 'package:senior/app/static.dart';
import 'package:senior/presentation/home/HomeApp.dart';
import 'package:senior/presentation/sign%20up/signUpScreen.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                                builder: (context) => const SignUpScreen()),
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
                        'assets/images/app_img.jpeg.jpg',
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
                        defaultFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null; // Return null if the input is valid
                          },
                          controller: userNameController,
                          isPassword: false,
                          type: TextInputType.name,
                          text: 'Email',
                          prefix: IconBroken.User,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        defaultFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null; // Return null if the input is valid
                          },
                          controller: passwordController,
                          isPassword: isPassword ? true : false ,
                          type: TextInputType.name,
                          text: 'Password',
                          prefix: IconBroken.Lock,
                          suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                          suffixPressed: (){
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        SizedBox(
                          width: 300,
                          child: staticButton(
                              text: 'LOGIN',
                              colorButton: defaultColor,
                              function: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeApp()),
                                        (route) => false,
                                  );
                                }
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
      ),
    );
  }
}
