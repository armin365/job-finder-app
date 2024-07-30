import 'package:flutter/material.dart';
import 'package:job_finder_app/models/data.dart';
import 'package:job_finder_app/screens/users/pages/jobdetails.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:job_finder_app/widgets/customtext.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});
  static const pagename = '/job';

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var isClicked = false;
    var resultsNumber = jobs.length;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Stack(
          children: [
            Positioned.fill(
                child: Container(
              color: Colors.white.withOpacity(0.60),
            )),
            Positioned(
              top: 180,
              left: 1,
              right: 1,
              bottom: 10,
              child: Container(
                color: Colors.white.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //chips
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: jobcategories.length,
                            itemBuilder: (BuildContext context, int index) {
                              var category = jobcategories[index];
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            category.image,
                                            width: 60,
                                            height: 50,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Text(category.title),
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            resultsNumber.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text("results")
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      //get premium
                      SizedBox(
                        height: 120,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/istockphoto-1347652268-612x612.jpg',
                                fit: BoxFit.cover,
                              ),
                            )),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.deepPurpleAccent
                                              .withOpacity(0.9),
                                          Colors.cyan.withOpacity(0.9),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                            Positioned(
                                top: 15,
                                bottom: 15,
                                right: 15,
                                left: 15,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "25% Off",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "For your first premium",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Text(
                                            "Get a premium",
                                            style: TextStyle(
                                                color: Colors.deepPurpleAccent),
                                          ),
                                        ))
                                  ],
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.35,
                        child: ListView.builder(
                          itemCount: jobs.length,
                          itemBuilder: (BuildContext context, int index) {
                            var job = jobs[index];
                            String timeAgo = timeago.format(job.postedDate);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 26,
                                        backgroundImage:
                                            AssetImage((job.profile)),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isClicked = !isClicked;
                                          });
                                        },
                                        icon: Icon(
                                          isClicked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: primaryColor,
                                        ),
                                      ),
                                      title: Text(
                                        job.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(customText(
                                            job.company,
                                          )),
                                          const Text('.'),
                                          Text(customText(
                                            job.location,
                                          )),
                                          const Text('.'),
                                          Text(job.jobtype),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.schedule,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(timeAgo.length > 13
                                                  ? timeAgo.substring(7)
                                                  : timeAgo),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Icon(
                                                Icons.wallet,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(job.salary.toString())
                                            ],
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  side: const BorderSide(
                                                      width: 2,
                                                      color: Colors
                                                          .deepPurpleAccent)),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            JobdetailsScreen(
                                                                job: job)));
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Apply",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .deepPurpleAccent,
                                                      fontSize: 19),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 150,
                left: 10,
                right: 10,
                child: Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: const StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'UX/UI Designer',
                        suffixIcon: const CircleAvatar(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.search),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )),
            const Positioned(
              top: 60,
              left: 10,
              right: 10,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Good Morning,',
                  style: TextStyle(fontSize: 15),
                ),
                subtitle: Text(
                  'Amiin',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 27),
                ),
                trailing: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(('assets/images/profile.jpg')),
                ),
              ),
            ),
          ],
        ));
  }
}
