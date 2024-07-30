import 'package:flutter/material.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminCategories extends StatefulWidget {
  const AdminCategories({super.key});
  static const pagename = '/admincategories';

  @override
  State<AdminCategories> createState() => _AdminCategoriesState();
}

class _AdminCategoriesState extends State<AdminCategories> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Jobs'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180, // Adjust width as needed
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
                            radius: 30,
                            backgroundColor: Colors.blue[100],
                            child: const Icon(
                              Icons.laptop,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Technology',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            '43 Jobs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            child: const Text(
                              'View All',
                              style: TextStyle(color: iconColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: 180, // Adjust width as needed
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
                            radius: 30,
                            backgroundColor: Colors.blue[100],
                            child: const Icon(
                              Icons.business_center,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Bussines',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            '14 Jobs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            child: const Text(
                              'View All',
                              style: TextStyle(color: iconColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180, // Adjust width as needed
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
                            radius: 30,
                            backgroundColor: Colors.blue[100],
                            child: const Icon(
                              Icons.medication,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Health',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            '51 Jobs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            child: const Text(
                              'View All',
                              style: TextStyle(color: iconColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: 180, // Adjust width as needed
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
                            radius: 30,
                            backgroundColor: Colors.blue[100],
                            child: const Icon(
                              Icons.school_sharp,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Education',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            '37 Jobs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            child: const Text(
                              'View all',
                              style: TextStyle(color: iconColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
