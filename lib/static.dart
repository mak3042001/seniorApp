import 'package:flutter/material.dart';
import 'package:senior/styles/colors.dart';

Widget textFieldStatic({
  required String title,
  required IconData iconUse,
  required bool isPassword,
  required bool isEmail,
  required bool isPhone,
  required bool isProfile,
  GestureTapCallback? onTap,
  required TextEditingController controller,
}) {
  return Container(
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
    ),
    child: TextField(
      controller: controller,
      onTap: onTap,
      obscureText: isPassword ? true : false,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isPhone
              ? TextInputType.number
              : TextInputType.name,
      style: TextStyle(
        color: defaultColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
          suffixIcon: Icon(
            iconUse,
            color: defaultColor,
          ),
          border: isProfile
              ? OutlineInputBorder(
                  borderSide: const BorderSide(
                      style: BorderStyle.solid, color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
          hintText: title,
          hintStyle: TextStyle(
            color: defaultColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
    ),
  );
}

Widget staticButton(
    {required String text, required Color colorButton, required function}) {
  return MaterialButton(
    minWidth: double.infinity,
    height: 55.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    color: colorButton,
    onPressed: function,
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget defaultFormField({
  TextEditingController? controller,
  required TextInputType type,
  required String text,
  required IconData prefix,
  IconData? suffix,
  ValueChanged? onChange,
  GestureTapCallback? onTap,
  ValueChanged? onSubmit,
  bool isPassword = false,
  VoidCallback? suffixpressed,
}) =>
    TextFormField(
      controller: controller,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );
