import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_finder_app/common/textfields.dart';
import 'package:job_finder_app/models/category_model.dart';
import 'package:job_finder_app/models/company_model.dart';
import 'package:job_finder_app/models/data.dart';
import 'package:job_finder_app/models/sub_category_model.dart';
import 'package:job_finder_app/providers/company_provider.dart';
import 'package:job_finder_app/screens/admin/services/adminservices.dart';
import 'package:job_finder_app/screens/agents/services/agent_services.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:provider/provider.dart';

class Agentpostjob extends StatefulWidget {
  const Agentpostjob({super.key, required this.company});
  static const pagename = '/agentpostjob';
  final Company company;
  @override
  State<Agentpostjob> createState() => _AgentpostjobState();
}

class _AgentpostjobState extends State<Agentpostjob> {
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
  final Adminservices adminservices = Adminservices();

  List<JobCategory> categories = [];
  List<SubCategory> subcategories = [];
  JobCategory? selectedCategory;
  SubCategory? selectedsubCategory;
  void getCategories() async {
    categories = await adminservices.getAllCategories(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  void getsubCategories() async {
    subcategories = await adminservices.getAllsubCategories(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getsubCategories();
    getCategories();
    super.initState();
  }

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

  final AgentServices agentServices = AgentServices();
  void createJob() {
    List<String> responsibilities =
        responsibilityControllers.map((controller) => controller.text).toList();
    List<String> qualifications =
        qualificationControllers.map((controller) => controller.text).toList();
    List<String> experienceRequirements = experiencerequirementcontrollers
        .map((controller) => controller.text)
        .toList();
    agentServices.createJob(
        context: context,
        companyId: widget.company.id,
        title: titleController.text,
        category: selectedCategory!.id,
        subcategory: selectedsubCategory!.id,
        location: selectedlocation!,
        description: descriptionController.text,
        responsibilities: responsibilities,
        qualifications: qualifications,
        salary: salaryController.text,
        experienceRequirements: experienceRequirements,
        jobOverview: jobOverviewController.text,
        jobType: jobTypeController.text,
        expiryDate: expiryDateController.text);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Post Job '),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: ElevatedButton(
          onPressed: createJob,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: iconColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text('Add'),
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
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomTextFeild(
                controller: titleController,
                hintText: widget.company.id,
                textInputType: TextInputType.name,
                myicon: Icons.title,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              DropdownButtonFormField(
                  items: categories.map<DropdownMenuItem<JobCategory>>(
                      (JobCategory category) {
                    return DropdownMenuItem<JobCategory>(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                  value: selectedCategory,
                  hint: const Center(
                    child: Text('select Category'),
                  ),
                  icon: const Icon(Icons.category),
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
                  onChanged: (JobCategory? newvalue) {
                    setState(() {
                      selectedCategory = newvalue;
                      subcategoryController.text = newvalue?.name ?? '';
                    });
                  }),
              SizedBox(
                height: size.height * 0.01,
              ),
              DropdownButtonFormField(
                  items: subcategories.map<DropdownMenuItem<SubCategory>>(
                      (SubCategory subcategory) {
                    return DropdownMenuItem<SubCategory>(
                      value: subcategory,
                      child: Text(subcategory.name),
                    );
                  }).toList(),
                  value: selectedsubCategory,
                  hint: const Center(
                    child: Text('select subcat'),
                  ),
                  icon: const Icon(Icons.category),
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
                  onChanged: (SubCategory? newsubvalue) {
                    setState(() {
                      selectedsubCategory = newsubvalue;
                      subcategoryController.text = newsubvalue?.name ?? '';
                    });
                  }),
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
