import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_finder_app/constants/globalvariales.dart';
import 'package:job_finder_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Favoriteservices {
  void addToFavorite(
      {required BuildContext context, required String jobId}) async {
    try {
      var userId = Provider.of<Userprovider>(context, listen: false).users.id;
      http.Response res =
          await http.post(Uri.parse('$url/api/favorite/addfavorite'),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "userId": userId,
                "jobId": jobId,
              }));
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        showSnackMessage(context, 'added success fully');
      }
      if (res.statusCode == 400) {
        showSnackMessage(context, jsonDecode(res.body)['message']);
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
  }

  void removeFavorite(
      {required BuildContext context, required int index}) async {
    try {
      var userId = Provider.of<Userprovider>(context, listen: false).users.id;

      http.Response res =
          await http.post(Uri.parse('$url/api/favorite/removeFavorite'),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "userId": userId,
                "index": index,
              }));
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        showSnackMessage(context, 'removed');
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
  }
}
