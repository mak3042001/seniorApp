import 'package:flutter/material.dart';
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

Widget staticButton({
  required String text,
  required Color colorButton,
  required function,
}) {
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
  required TextEditingController controller,
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
      // enableInteractiveSelection: false,
      // focusNode: AlwaysDisabledFocusNode(),
      controller: controller,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        hintText: text,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );

