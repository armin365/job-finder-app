import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_finder_app/common/textfields.dart';
import 'package:job_finder_app/screens/admin/services/adminservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminAddCategory extends StatefulWidget {
  const AdminAddCategory({super.key});
  static const pagename = '/adminaddcategory';

  @override
  State<AdminAddCategory> createState() => _AdminAddCategoryState();
}

class _AdminAddCategoryState extends State<AdminAddCategory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final Adminservices adminservices = Adminservices();

  File? _image;
  void _image_picker() async {
    try {
      var pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        setState(() {
          _image = File(pickImage.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void createcategory() {
    adminservices.createCategory(
        context: context,
        name: nameController.text,
        description: descriptionController.text,
        image: _image!);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Add Category'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: ElevatedButton(
          onPressed: createcategory,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: iconColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text('Save'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            GestureDetector(
              onTap: _image_picker,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: const Border.fromBorderSide(
                        BorderSide(color: Colors.black))),
                height: size.height * 0.23,
                width: double.infinity,
                child: _image != null
                    ? Image.file(_image!)
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload),
                          Text('Upload Image'),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextFeild(
              controller: nameController,
              hintText: "Name",
              textInputType: TextInputType.name,
              myicon: Icons.category,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomTextFeild(
              controller: descriptionController,
              hintText: "Description",
              textInputType: TextInputType.name,
              myicon: Icons.note,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
