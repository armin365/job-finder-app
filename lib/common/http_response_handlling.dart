import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder_app/constants/globalvariales.dart';

void httpResponseHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();
      break;
    case 400:
      showSnackMessage(context, jsonDecode(response.body)['message']);
      break;
    case 401:
      showSnackMessage(context, jsonDecode(response.body)['message']);
      break;
    case 404:
      showSnackMessage(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackMessage(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackMessage(context, response.body);
  }
}
