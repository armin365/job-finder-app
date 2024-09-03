import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_finder_app/common/textfields.dart';
import 'package:job_finder_app/models/company_model.dart';
import 'package:job_finder_app/models/data.dart';
import 'package:job_finder_app/providers/company_provider.dart';
import 'package:job_finder_app/screens/users/pages/profile.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:provider/provider.dart';

class AgentprofileScreen extends StatefulWidget {
  const AgentprofileScreen({super.key, required this.company});
  static const pagename = '/agentprofile';
  final Company company;
  @override
  State<AgentprofileScreen> createState() => _AgentprofileScreenState();
}

class _AgentprofileScreenState extends State<AgentprofileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController contactEmailController = TextEditingController();
  TextEditingController contactPhoneController = TextEditingController();
  Authservices authservices = Authservices();

  String? selectedlocation;

  File? _logo;
  void _logo_picker() async {
    try {
      var pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        setState(() {
          _logo = File(pickImage.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void updateprofile() {
    authservices.updateCompany(
        context: context,
        name: nameController.text,
        id: widget.company.id,
        website: websiteController.text,
        description: descriptionController.text,
        location: locationController.text,
        industry: industryController.text,
        contactEmail: contactEmailController.text,
        contactPhone: contactPhoneController.text,
        logo: _logo!);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var company = Provider.of<CompanyProvider>(context).companies;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Update Profile'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: ElevatedButton(
          onPressed: updateprofile,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: iconColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text('Update'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _logo_picker,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: blue1Color,
                        ),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: _logo != null
                              ? FileImage(_logo!)
                              : NetworkImage(company.logo!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Change logo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        const Icon(
                          Icons.edit,
                          size: 12,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomTextFeild(
                controller: nameController,
                hintText: company.name,
                textInputType: TextInputType.name,
                myicon: Icons.person,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: websiteController,
                hintText: company.website!,
                textInputType: TextInputType.name,
                myicon: Icons.email,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: descriptionController,
                hintText: "Description",
                textInputType: TextInputType.name,
                myicon: Icons.email,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: industryController,
                hintText: "Telecomunication",
                textInputType: TextInputType.name,
                myicon: Icons.email,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              DropdownButtonFormField(
                  items:
                      locations.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: selectedlocation,
                  hint: const Center(
                    child: Text('select Location'),
                  ),
                  icon: const Icon(Icons.location_on),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: primaryColor),
                    ),
                  ),
                  onChanged: (String? newvalue) {
                    setState(() {
                      selectedlocation = newvalue;
                      locationController.text = newvalue ?? '';
                    });
                  }),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: contactEmailController,
                hintText: "hormuud@gmail.com",
                textInputType: TextInputType.name,
                myicon: Icons.email,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: contactPhoneController,
                hintText: "061256663",
                textInputType: TextInputType.name,
                myicon: Icons.email,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
