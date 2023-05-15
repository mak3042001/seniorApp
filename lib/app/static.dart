import 'package:flutter/material.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  bool hasFocusBool;

  AlwaysDisabledFocusNode(this.hasFocusBool);

  @override
  bool get hasFocus => hasFocusBool;
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

// Widget defaultFormField({
//   required TextEditingController controller,
//   required TextInputType type,
//   required String text,
//   required IconData prefix,
//   IconData? suffix,
//   ValueChanged? onChange,
//   GestureTapCallback? onTap,
//   ValueChanged? onSubmit,
//   bool isPassword = false,
//   VoidCallback? suffixpressed,
//   FormFieldValidator? validator,
//   bool enableInteractiveSelection = true,
//   bool hasFocusBool = true,
//
// }) =>
//     TextFormField(
//       validator: validator,
//       enableInteractiveSelection: enableInteractiveSelection,
//       focusNode: AlwaysDisabledFocusNode(hasFocusBool),
//       controller: controller,
//       onChanged: onChange,
//       onFieldSubmitted: onSubmit,
//       onTap: onTap,
//       keyboardType: type,
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(20.0),
//         hintText: text,
//         prefixIcon: Icon(prefix),
//         suffixIcon: suffix != null
//             ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
//             : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20)
//         ),
//       ),
//     );

class defaultFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputType type;
  final IconData prefix;
  final IconData? suffix;
  final GestureTapCallback? onTap;
  final ValueChanged? onSubmit;
  bool isPassword = false;
  final VoidCallback? suffixPressed;

  defaultFormField({
    Key? key,
    required this.text,
    required this.controller,
    this.errorText,
    this.onChanged,
    required this.type,
    required this.prefix,
    this.suffix,
    this.onTap,
    this.onSubmit,
    this.suffixPressed,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: const EdgeInsets.all(20.0),
        labelText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
      ),
    );
  }
}

class defaultDisableFormField extends StatelessWidget {
  bool enableInteractiveSelection = false;
  bool hasFocusBool = false;
  final String text;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType type;
  final IconData prefix;
  final IconData? suffix;
  final GestureTapCallback? onTap;
  final ValueChanged? onSubmit;
  final bool isPassword = false;
  final VoidCallback? suffixPressed;

  defaultDisableFormField({
    Key? key,
    required this.enableInteractiveSelection,
    required this.hasFocusBool,
    required this.text,
    required this.controller,
    this.validator,
    this.onChanged,
    required this.type,
    required this.prefix,
    this.suffix,
    this.onTap,
    this.onSubmit,
    this.suffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: enableInteractiveSelection,
      focusNode: AlwaysDisabledFocusNode(hasFocusBool),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        labelText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
      ),
    );
  }
}
