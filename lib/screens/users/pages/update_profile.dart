import 'package:flutter/material.dart';
import 'package:job_finder_app/common/textfields.dart';
import 'package:job_finder_app/models/data.dart';

import 'package:job_finder_app/themes/themes.dart';

class Updateprofile extends StatefulWidget {
  const Updateprofile({super.key});

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

  String? selectedlocation;
  String? selectedprelocation;
  String? selectedsex;

  String? selectededulevel;
  String? selectedstatus;

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
    for (var controller in workExperienceControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: ElevatedButton(
          onPressed: () {},
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
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                    ),
                    Text(
                      "Edit Profile",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.share)
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: blue1Color,
                        ),
                        child: const CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              AssetImage(('assets/images/profile.jpg')),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Change Picture",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Icon(
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
                  hintText: "amiin",
                  textInputType: TextInputType.name,
                  myicon: Icons.person,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomTextFeild(
                  controller: emailController,
                  hintText: "amiin@gmail.com",
                  textInputType: TextInputType.name,
                  myicon: Icons.email,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomTextFeild(
                  controller: phoneController,
                  hintText: "612537354",
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
                        selectedprelocation = newvalue;
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
                  hintText: "age",
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
                    value: selectedlocation,
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
                )),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Divider(),
                DropdownButtonFormField(
                    items:
                        edulevels.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: selectededulevel,
                    hint: const Center(
                      child: Text('select Education level'),
                    ),
                    icon: const Icon(Icons.school),
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
                        selectededulevel = newvalue;
                        edulevelController.text = newvalue ?? '';
                      });
                    }),
                SizedBox(
                  height: size.height * 0.01,
                ),
                if (selectededulevel == 'University or above') ...[
                  CustomTextFeild(
                      controller: universitynameController,
                      hintText: 'University name',
                      textInputType: TextInputType.text,
                      myicon: Icons.school),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CustomTextFeild(
                      controller: facultyController,
                      hintText: 'Faculty',
                      textInputType: TextInputType.text,
                      myicon: Icons.library_books),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  DropdownButtonFormField(
                      items: statuses
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: selectedstatus,
                      hint: const Center(
                        child: Text('select Status'),
                      ),
                      icon: const Icon(Icons.collections_bookmark),
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
                          selectedstatus = newvalue;
                          statusController.text = newvalue ?? '';
                        });
                      }),
                ] else if (selectededulevel == 'School') ...[
                  CustomTextFeild(
                      controller: schoolnameController,
                      hintText: "School name",
                      textInputType: TextInputType.text,
                      myicon: Icons.school),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CustomTextFeild(
                      controller: gradeController,
                      hintText: "grade",
                      textInputType: TextInputType.text,
                      myicon: Icons.grade),
                ],
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
