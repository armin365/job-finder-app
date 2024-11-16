import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_finder_app/common/textfields.dart';
import 'package:job_finder_app/models/data.dart';
import 'package:job_finder_app/models/usermodel.dart';
import 'package:job_finder_app/providers/user_provider.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';

import 'package:job_finder_app/themes/themes.dart';
import 'package:provider/provider.dart';

class Updateprofile extends StatefulWidget {
  const Updateprofile({super.key, required this.user});
  static const pagename = '/updateProfile';
  final User user;

  @override
  State<Updateprofile> createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController universitynameController = TextEditingController();
  TextEditingController schoolnameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController preferredLocationController = TextEditingController();

  TextEditingController edulevelController = TextEditingController();

  List<TextEditingController> workExperienceControllers = [];
  List<Widget> workExperienceFields = [];

  List<TextEditingController> educationControllers = [];
  List<Widget> educationFields = [];

  String? selectedlocation;
  String? selectedprelocation;
  String? selectedsex;

  String? selectededulevel;
  String? selectedstatus;

  void _addEducationField({String? education}) {
    setState(() {
      TextEditingController educationController =
          TextEditingController(text: education);
      educationControllers.add(educationController);
      educationFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomTextFeild(
            controller: educationController,
            hintText: "Education Level",
            textInputType: TextInputType.text,
            myicon: Icons.school,
          ),
        ),
      );
    });
  }

  void _addWorkExperienceField() {
    setState(() {
      TextEditingController workExperienceController = TextEditingController();
      workExperienceControllers.add(workExperienceController);
      workExperienceFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomTextFeild(
            controller: workExperienceController,
            hintText: "Work Experience",
            textInputType: TextInputType.text,
            myicon: Icons.work,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    sexController.dispose();
    ageController.dispose();
    preferredLocationController.dispose();
    universitynameController.dispose();
    schoolnameController.dispose();
    gradeController.dispose();
    facultyController.dispose();
    statusController.dispose();

    edulevelController.dispose();
    for (var controller in educationControllers) {
      controller.dispose();
    }
    for (var controller in workExperienceControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  final Authservices authservices = Authservices();
  void update() {
    List<String> educationLevels =
        educationControllers.map((controller) => controller.text).toList();
    List<String> workexp =
        workExperienceControllers.map((controller) => controller.text).toList();
    authservices.updateUsers(
        context: context,
        id: widget.user.id,
        name: nameController.text,
        email: emailController.text,
        phone: int.parse(phoneController.text),
        location: locationController.text,
        sex: sexController.text,
        age: ageController.text,
        preferredLocation: preferredLocationController.text,
        education: educationLevels,
        workExperience: workexp);
  }

  void changeprofie() {
    authservices.updateUsersProfile(
        context: context, id: widget.user.id, image: _logo!);
  }

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

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<Userprovider>(
      context,
    ).users;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: ElevatedButton(
          onPressed: update,
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        )),
                    const Text(
                      "Edit Profile",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.share)
                  ],
                ),
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
                                : NetworkImage(user.image ??
                                    'https://static.vecteezy.com/system/resources/thumbnails/002/318/271/small/user-profile-icon-free-vector.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: changeprofie,
                              child: const Text(
                                "Change Picture",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              )),
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
                  hintText: user.name,
                  textInputType: TextInputType.name,
                  myicon: Icons.person,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomTextFeild(
                  controller: emailController,
                  hintText: user.email,
                  textInputType: TextInputType.name,
                  myicon: Icons.email,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomTextFeild(
                  controller: phoneController,
                  hintText: user.phone.toString(),
                  textInputType: TextInputType.name,
                  myicon: Icons.phone,
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
                DropdownButtonFormField(
                    items:
                        genders.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: selectedsex,
                    hint: const Center(
                      child: Text('select gender'),
                    ),
                    icon: const Icon(Icons.boy),
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
                        selectedsex = newvalue;
                        sexController.text = newvalue ?? '';
                      });
                    }),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomTextFeild(
                  controller: ageController,
                  hintText: user.age.toString(),
                  textInputType: TextInputType.name,
                  myicon: Icons.date_range,
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
                    value: selectedprelocation,
                    hint: const Center(
                      child: Text('select preferredLocation'),
                    ),
                    icon: const Icon(Icons.location_city),
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
                        selectedprelocation = newvalue;
                        preferredLocationController.text = newvalue ?? '';
                      });
                    }),
                const Divider(),
                SizedBox(
                  height: size.height * 0.01,
                ),

                const Center(
                  child: Text(
                    "Education",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height * 0.01),

                // Display education fields
                ...educationFields,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => _addEducationField(),
                      icon: const Icon(Icons.add),
                    ),
                    const Text("Add Education Level")
                  ],
                ),
                // DropdownButtonFormField(
                //     items:
                //         edulevels.map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(value),
                //       );
                //     }).toList(),
                //     value: selectededulevel,
                //     hint: const Center(
                //       child: Text('select Education level'),
                //     ),
                //     icon: const Icon(Icons.school),
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(8),
                //         borderSide: const BorderSide(color: primaryColor),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(8),
                //         borderSide: const BorderSide(color: primaryColor),
                //       ),
                //     ),
                //     onChanged: (String? newvalue) {
                //       setState(() {
                //         selectededulevel = newvalue;
                //         edulevelController.text = newvalue ?? '';
                //       });
                //     }),
                // SizedBox(
                //   height: size.height * 0.01,
                // ),
                // if (selectededulevel == 'University or above') ...[
                //   CustomTextFeild(
                //       controller: universitynameController,
                //       hintText: 'University name',
                //       textInputType: TextInputType.text,
                //       myicon: Icons.school),
                //   SizedBox(
                //     height: size.height * 0.01,
                //   ),
                //   CustomTextFeild(
                //       controller: facultyController,
                //       hintText: 'Faculty',
                //       textInputType: TextInputType.text,
                //       myicon: Icons.library_books),
                //   SizedBox(
                //     height: size.height * 0.01,
                //   ),
                //   DropdownButtonFormField(
                //       items: statuses
                //           .map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //       value: selectedstatus,
                //       hint: const Center(
                //         child: Text('select Status'),
                //       ),
                //       icon: const Icon(Icons.collections_bookmark),
                //       decoration: InputDecoration(
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(8),
                //           borderSide: const BorderSide(color: primaryColor),
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(8),
                //           borderSide: const BorderSide(color: primaryColor),
                //         ),
                //       ),
                //       onChanged: (String? newvalue) {
                //         setState(() {
                //           selectedstatus = newvalue;
                //           statusController.text = newvalue ?? '';
                //         });
                //       }),
                // ] else if (selectededulevel == 'School') ...[
                //   CustomTextFeild(
                //       controller: schoolnameController,
                //       hintText: "School name",
                //       textInputType: TextInputType.text,
                //       myicon: Icons.school),
                //   SizedBox(
                //     height: size.height * 0.01,
                //   ),
                //   CustomTextFeild(
                //       controller: gradeController,
                //       hintText: "grade",
                //       textInputType: TextInputType.text,
                //       myicon: Icons.grade),
                // ],
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Divider(),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Center(
                    child: Text(
                  "Work Experiance",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Divider(),
                ...workExperienceFields,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _addWorkExperienceField,
                      icon: const Icon(Icons.add),
                    ),
                    const Text("add Work experience")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
