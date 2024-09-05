import 'package:flutter/material.dart';
import 'package:job_finder_app/providers/user_provider.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:provider/provider.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({
    super.key,
  });
  static const pagename = '/ViewProfileScreen';

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var user = Provider.of<Userprovider>(
      context,
    ).users;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    )),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: blue1Color,
                          ),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: (user.image != null &&
                                    user.image!.isNotEmpty &&
                                    Uri.tryParse(user.image!)
                                            ?.hasAbsolutePath ==
                                        true)
                                ? NetworkImage(user.image!)
                                : const AssetImage('assets/images/profile.jpg')
                                    as ImageProvider,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          const Text("name: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            user.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          const Text("email: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            user.email,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          const Text("phone: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            user.phone.toString().isNotEmpty == true
                                ? user.phone.toString()
                                : "No registered number",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          const Text("age: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            user.age ?? "No age available",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          const Text("location: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            user.location ?? "No location available",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          const Text("preferred-location: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            user.preferredLocation ??
                                "No preferedlocation available",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text("Education",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            user.Education != null && user.Education!.isNotEmpty
                                ? user.Education!.join('\n')
                                : "No Education info available",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text("Work experience",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            user.workExperience != null &&
                                    user.workExperience!.isNotEmpty
                                ? user.workExperience!.join('\n')
                                : "No work-experience info available",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
