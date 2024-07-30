import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFeild extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String hintText;
  final TextInputType textInputType;
  final IconData myicon;
  CustomTextFeild(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.textInputType, required this.myicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
