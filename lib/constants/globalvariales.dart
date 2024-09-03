import 'package:flutter/material.dart';

String url = 'https://job-finder-app-backend.onrender.com';

void showSnackMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 5),
    content: Text(message),
  ));
}
