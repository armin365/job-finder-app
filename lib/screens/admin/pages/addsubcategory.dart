import 'package:flutter/material.dart';
import 'package:job_finder_app/common/textfields.dart';
import 'package:job_finder_app/models/category_model.dart';
import 'package:job_finder_app/screens/admin/services/adminservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminAddSubCategory extends StatefulWidget {
  const AdminAddSubCategory({super.key});
  static const pagename = '/adminaddsubcategory';

  @override
  State<AdminAddSubCategory> createState() => _AdminAddSubCategoryState();
}

class _AdminAddSubCategoryState extends State<AdminAddSubCategory> {
  TextEditingController subcategoryController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final Adminservices adminservices = Adminservices();

  List<JobCategory> categories = [];
  JobCategory? selectedCategory;
  void getCategories() async {
    categories = await adminservices.getAllCategories(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  void createSubcategory() {
    adminservices.createSubCategory(
      context: context,
      name: nameController.text,
      categoryid: selectedCategory!.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Add Sub Category'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: ElevatedButton(
          onPressed: createSubcategory,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            DropdownButtonFormField(
                items: categories
                    .map<DropdownMenuItem<JobCategory>>((JobCategory category) {
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
            CustomTextFeild(
              controller: nameController,
              hintText: "Name",
              textInputType: TextInputType.name,
              myicon: Icons.list,
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
