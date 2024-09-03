import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_finder_app/common/textfields.dart';
import 'package:job_finder_app/models/data.dart';
import 'package:job_finder_app/themes/themes.dart';

class AgentUpdatejob extends StatefulWidget {
  const AgentUpdatejob({super.key});
  static const pagename = '/agentupdatejob';
  @override
  State<AgentUpdatejob> createState() => _AgentUpdatejobState();
}

class _AgentUpdatejobState extends State<AgentUpdatejob> {
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController salaryController = TextEditingController();

  TextEditingController jobOverviewController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();

  List<TextEditingController> responsibilityControllers = [];
  List<Widget> responsibilityFields = [];

  List<TextEditingController> qualificationControllers = [];
  List<Widget> qualificationFields = [];

  List<TextEditingController> experiencerequirementcontrollers = [];
  List<Widget> experienceRequirementFields = [];

  String? selectedlocation;

  void _addjobResponsibilityField() {
    setState(() {
      TextEditingController responsibilitiesController =
          TextEditingController();
      responsibilityControllers.add(responsibilitiesController);
      responsibilityFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomTextFeild(
            controller: responsibilitiesController,
            hintText: "Responsibility",
            textInputType: TextInputType.text,
            myicon: Icons.work,
          ),
        ),
      );
    });
  }

  void _addqualificationField() {
    setState(() {
      TextEditingController qualificationsController = TextEditingController();
      qualificationControllers.add(qualificationsController);
      qualificationFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomTextFeild(
            controller: qualificationsController,
            hintText: "job Qualification",
            textInputType: TextInputType.text,
            myicon: Icons.work,
          ),
        ),
      );
    });
  }

  void _addExperienceRequirementField() {
    setState(() {
      TextEditingController experienceRequirementsController =
          TextEditingController();
      experiencerequirementcontrollers.add(experienceRequirementsController);
      experienceRequirementFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomTextFeild(
            controller: experienceRequirementsController,
            hintText: "Experience requirement",
            textInputType: TextInputType.text,
            myicon: Icons.work,
          ),
        ),
      );
    });
  }

  void pickdate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(3000));
    if (picked != null) {
      setState(() {
        expiryDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Update job'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomTextFeild(
                controller: titleController,
                hintText: "job title",
                textInputType: TextInputType.name,
                myicon: Icons.title,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: categoryController,
                hintText: "job category",
                textInputType: TextInputType.name,
                myicon: Icons.category,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: subcategoryController,
                hintText: "job subcategory",
                textInputType: TextInputType.name,
                myicon: Icons.business,
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
                    child: Text('job Location'),
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
                controller: descriptionController,
                hintText: "job Description",
                textInputType: TextInputType.name,
                maxline: 4,
                myicon: Icons.description,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ...responsibilityFields,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _addjobResponsibilityField,
                    icon: const Icon(Icons.add),
                  ),
                  const Text("add job Responsibility")
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ...qualificationFields,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _addqualificationField,
                    icon: const Icon(Icons.add),
                  ),
                  const Text("add job Qualification")
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: salaryController,
                hintText: "job salary",
                textInputType: TextInputType.name,
                myicon: Icons.attach_money_outlined,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ...experienceRequirementFields,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _addExperienceRequirementField,
                    icon: const Icon(Icons.add),
                  ),
                  const Text("add job Experience requirements")
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: jobOverviewController,
                hintText: "job overview",
                textInputType: TextInputType.name,
                myicon: Icons.details,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextFeild(
                controller: jobTypeController,
                hintText: "job Type",
                textInputType: TextInputType.name,
                myicon: Icons.type_specimen,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextFormField(
                controller: expiryDateController,
                keyboardType: TextInputType.none,
                readOnly: true,
                onTap: pickdate,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.calendar_today),
                  hintText: 'Expiry date',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.deepPurpleAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
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
