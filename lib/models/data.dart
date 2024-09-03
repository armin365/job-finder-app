import 'package:job_finder_app/models/jobmodel.dart';

List jobcategories = [
  JobCategorys(
    title: "Software Development",
    image: "assets/images/hormuud.png",
  ),
  JobCategorys(
    title: "Design",
    image: "assets/images/hormuud.png",
  ),
  JobCategorys(
    title: "Marketing",
    image: "assets/images/softw.png",
  ),
  JobCategorys(
    title: "Sales",
    image: "assets/images/softw.png",
  ),
];

// List<Job> jobs = [
//   Job(
//     title: 'Software Engineer',
//     description: 'Develop and maintain software applications.',
//     company: 'Software Academy',
//     location: 'New York, NY',
//     salary: 90000,
//     jobtype: 'internship',
//     category: 'Software Development',
//     profile: 'assets/images/soft.png',
//     postedDate: DateTime.now().subtract(const Duration(days: 30)),
//   ),
//   Job(
//     title: 'Graphic Designer',
//     description: 'Create visual content for print and digital media.',
//     company: 'Design Studio',
//     location: 'San Francisco, CA',
//     salary: 60000,
//     jobtype: 'full-time',
//     category: 'Design',
//     profile: 'assets/images/profile.jpg',
//     postedDate: DateTime.now().subtract(const Duration(days: 7)),
//   ),
//   Job(
//     title: 'Marketing Manager',
//     description: 'Plan and execute marketing strategies.',
//     company: 'Marketing Inc',
//     location: 'Los Angeles, CA',
//     salary: 75000,
//     jobtype: 'part-type',
//     category: 'Marketing',
//     profile: 'assets/images/hormuud.png',
//     postedDate: DateTime.now().subtract(const Duration(days: 50)),
//   ),
//   Job(
//     title: 'Software Developer',
//     description: 'Plan and execute softwares.',
//     company: 'Hormuud ',
//     location: 'Mogadishu',
//     salary: 75000,
//     jobtype: 'Remote',
//     category: 'Software Development',
//     profile: 'assets/images/hormuud.png',
//     postedDate: DateTime.now().subtract(const Duration(days: 90)),
//   ),
// ];

class JobCategorys {
  String title;
  String image;

  JobCategorys({
    required this.title,
    required this.image,
  });
}

List<String> locations = [
  "Mogadishu",
  "Hargeisa",
  "Bosaso",
  "Garowe",
  "Kismayo",
  "Baidoa",
  "Beledweyne",
  "Jowhar",
  "Merca",
  "Galkayo",
  "Burao",
  "Borama",
  "Las Anod",
  "Dhusamareb",
  "Garoowe",
  "Afgooye",
  "Barbera",
  "Qardho",
  "El Wakh",
  "Luuq",
  "Wanlaweyn",
  "Hobyo",
  "Adado",
  "Eyl",
  "Balad",
  "Afmadow",
  "Ceel Buur",
  "Zeila",
  "Berbera",
  "Sheikh"
];

List<String> genders = ["Male","Female"];
List<String> edulevels = ["Not educated","School","University or above",];
List<String> statuses = ["Gratuated","Not Graduated", "Batch", "Master or above",];
