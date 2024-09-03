import 'package:flutter/material.dart';
import 'package:job_finder_app/models/sub_category_model.dart';
import 'package:job_finder_app/screens/admin/pages/addsubcategory.dart';
import 'package:job_finder_app/screens/admin/services/adminservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminSubCategories extends StatefulWidget {
  const AdminSubCategories({super.key});
  static const pagename = '/adminSubcategories';
  @override
  State<AdminSubCategories> createState() => _AdminSubCategoriesState();
}

class _AdminSubCategoriesState extends State<AdminSubCategories> {
  final Adminservices adminservices = Adminservices();
  List<SubCategory> subcategories = [];

  void getsubCategories() async {
    subcategories = await adminservices.getAllsubCategories(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getsubCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Subcategories'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AdminAddSubCategory.pagename);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: subcategories.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                  child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: subcategories.length,
                      itemBuilder: (BuildContext context, int index) {
                        var subcat = subcategories[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            color: iconColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(subcat.name),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
            ),
    );
  }
}
