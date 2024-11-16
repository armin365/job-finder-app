import 'package:flutter/material.dart';
import 'package:job_finder_app/models/category_model.dart';
import 'package:job_finder_app/screens/admin/pages/addcategory.dart';
import 'package:job_finder_app/screens/admin/services/adminservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminCategories extends StatefulWidget {
  const AdminCategories({super.key});
  static const pagename = '/admincategories';

  @override
  State<AdminCategories> createState() => _AdminCategoriesState();
}

class _AdminCategoriesState extends State<AdminCategories> {
  final Adminservices adminservices = Adminservices();

  List<JobCategory> categories = [];
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('categories'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AdminAddCategory.pagename);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: backColor,
                      ),
                      child: const Row(
                        children: [Icon(Icons.sort), Text('sort')],
                      )),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              categories.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/splash.png'),
                        CircularProgressIndicator(),
                      ],
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 6,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 250),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          var category = categories[index];
                          return Container(
                            width: 180,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: backColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 16.0),
                                CircleAvatar(
                                    radius: 26,
                                    backgroundImage:
                                        NetworkImage(category.image)),
                                const SizedBox(height: 8.0),
                                Flexible(
                                  child: Text(
                                    category.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  '${categories.length.toString()} jobs',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.blue, // background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                  ),
                                  child: const Text(
                                    'View All',
                                    style: TextStyle(color: iconColor),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
