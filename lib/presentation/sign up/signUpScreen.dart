import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/colors.dart';
import 'package:senior/app/static.dart';
import 'package:senior/presentation/home/HomeApp.dart';
import 'package:senior/presentation/login/login_view/loginScreen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime selectedDate = DateTime.now();

  TextEditingController dateController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isPassword = true;

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
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
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
                                  builder: (context) => const LoginScreen()),
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
                              'assets/images/app_img.jpeg.jpg',
                              fit: BoxFit.cover,
                              height: 180.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          errorText: "",
                          controller: userNameController,
                          type: TextInputType.name,
                          text: 'email',
                          prefix: IconBroken.User,
                          isPassword: false,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          errorText: "",
                          controller: passwordController,
                          type: TextInputType.name,
                          prefix: IconBroken.Lock,
                          text: 'password',
                          isPassword: isPassword,
                          suffix: isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          errorText: "",
                          controller: phoneController,
                          type: TextInputType.phone,
                          text: 'Phone',
                          prefix: IconBroken.Call,
                          isPassword: false,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultDisableFormField(
                          enableInteractiveSelection: false,
                          hasFocusBool: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your birthdate';
                            }
                            return null; // Return null if the input is valid
                          },
                          controller: dateController,
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
                          type: TextInputType.none,
                          text: dateController.text != null
                              ? 'Birthdate'
                              : dateController.text,
                          prefix: IconBroken.Calendar,
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
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeApp()),
                                      (route) => false);
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
