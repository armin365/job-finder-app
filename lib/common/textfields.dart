import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFeild extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String hintText;
  final int? maxline;
  final TextInputType textInputType;
  final IconData myicon;
  CustomTextFeild(
      {super.key,
      required this.controller,
      this.maxline,
      required this.hintText,
      required this.textInputType,
      required this.myicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(myicon),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.deepPurpleAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.deepPurpleAccent),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}
