import 'package:flutter/material.dart';
import 'package:job_finder_app/models/applicant_model.dart';
import 'package:job_finder_app/screens/users/services/applicationservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class AgentUpdateApplicant extends StatefulWidget {
  const AgentUpdateApplicant({super.key, required this.application});
  final Application application;
  static const pagename = '/agentupdateapplicant';

  @override
  State<AgentUpdateApplicant> createState() => _AgentUpdateApplicantState();
}

class _AgentUpdateApplicantState extends State<AgentUpdateApplicant> {
  Applicationservices applicationservices = Applicationservices();
  List<Application> applicant = [];
  void acceptApplicant() {
    applicationservices.updateApplicantStatus(
        context: context, id: widget.application.id!, status: "accepted");
  }

  void rejectApplicant() {
    applicationservices.updateApplicantStatus(
        context: context, id: widget.application.id!, status: "rejected");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
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
                            backgroundImage: (widget.application.user!.image !=
                                        null &&
                                    widget
                                        .application.user?.image!.isNotEmpty &&
                                    Uri.tryParse(
                                                widget.application.user?.image!)
                                            ?.hasAbsolutePath ==
                                        true)
                                ? NetworkImage(widget.application.user!.image!)
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
                            widget.application.user!.name!,
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
                            widget.application.user!.email,
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
                            widget.application.user?.phone
                                        ?.toString()
                                        .isNotEmpty ==
                                    true
                                ? widget.application.user!.phone!.toString()
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
                            widget.application.user?.age ?? "No age available",
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
                            widget.application.user?.location ??
                                "No location available",
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
                            widget.application.user?.preferredLocation ??
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
                            widget.application.user?.Education != null &&
                                    widget
                                        .application.user!.Education!.isNotEmpty
                                ? widget.application.user!.Education!.join('\n')
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
                            widget.application.user?.workExperience != null &&
                                    widget.application.user!.workExperience!
                                        .isNotEmpty
                                ? widget.application.user!.workExperience!
                                    .join('\n')
                                : "No work-experience info available",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          const Text("job name: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            widget.application.job?.title ??
                                "No title available",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          const Text("job location: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            widget.application.job?.location ??
                                "No job location available",
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
                            child: Text("job responsibilities",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            widget.application.job?.responsibilities != null &&
                                    widget.application.job!.responsibilities!
                                        .isNotEmpty
                                ? widget.application.job!.responsibilities!
                                    .join('\n')
                                : "No job-responsibility info available",
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
                            child: Text("job qualifications",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            widget.application.job?.qualifications != null &&
                                    widget.application.job!.qualifications!
                                        .isNotEmpty
                                ? widget.application.job!.qualifications!
                                    .join('\n')
                                : "No work-experience info available",
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
                            child: Text("job experience requirements",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            widget.application.job?.experienceRequirements !=
                                        null &&
                                    widget.application.job!
                                        .experienceRequirements!.isNotEmpty
                                ? widget
                                    .application.job!.experienceRequirements!
                                    .join('\n')
                                : "No job-experience info available",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          acceptApplicant();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          rejectApplicant();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Reject',
                          style: TextStyle(color: Colors.white),
                        ),
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
