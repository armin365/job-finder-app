import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder_app/constants/globalvariales.dart';
import 'package:job_finder_app/models/category_model.dart';
import 'package:job_finder_app/models/sub_category_model.dart';
import 'package:job_finder_app/screens/admin/pages/addsubcategory.dart';
import 'package:job_finder_app/screens/admin/pages/categories.dart';
import 'package:job_finder_app/screens/admin/pages/subcategories.dart';

class Adminservices {
  void createCategory({
    required BuildContext context,
    required String name,
    required String description,
    required File image,
  }) async {
    try {
      String imageurl = '';
      final cloudinary =
          CloudinaryPublic('dks7u4tdh', 'dfd2bmjc', cache: false);

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );

      imageurl = response.secureUrl;

      if (imageurl.isNotEmpty) {
        http.Response res =
            await http.post(Uri.parse('$url/api/category/createCategory'),
                headers: {"Content-Type": "application/json"},
                body: jsonEncode({
                  "name": name,
                  "description": description,
                  "image": imageurl,
                }));

        if (res.statusCode == 201) {
          print(res.statusCode);
          print(res.body);
          showSnackMessage(context, "category created successfully");
          Navigator.pushNamed(context, AdminCategories.pagename);
        } else {
          print(res.statusCode);
          print(res.body);
          showSnackMessage(context, "some thing wrong");
        }
      } else {
        showSnackMessage(context, "image not found");
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
  }

  List<JobCategory> categories = [];
  Future<List<JobCategory>> getAllCategories(
      {required BuildContext context}) async {
    try {
      http.Response res = await http.get(
          Uri.parse('$url/api/category/getcategory'),
          headers: {"Content-Type": "application/json"});
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          categories
              .add(JobCategory.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
    return categories;
  }

  void createSubCategory({
    required BuildContext context,
    required String name,
    required String categoryid,
  }) async {
    try {
        http.Response res = await http.post(
            Uri.parse('$url/api/category/createSubCat/$categoryid'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "name": name,
              
            }));

        if (res.statusCode == 201) {
          print(res.statusCode);
          print(res.body);
          showSnackMessage(context, "Subcategory created successfully");
          Navigator.pushNamed(context, AdminSubCategories.pagename);
        } else {
          print(res.statusCode);
          print(res.body);
          showSnackMessage(context, "some thing wrong");
        }
      
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
  }

  List<SubCategory> subcategories = [];
  Future<List<SubCategory>> getAllsubCategories(
      {required BuildContext context}) async {
    try {
      http.Response res = await http.get(
          Uri.parse('$url/api/category/getsubcategory'),
          headers: {"Content-Type": "application/json"});
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          subcategories
              .add(SubCategory.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      print(e.toString());
      showSnackMessage(context, e.toString());
    }
    return subcategories;
  }
}
