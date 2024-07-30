import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/admin/pages/categories.dart';
import 'package:job_finder_app/screens/admin/pages/dashbord.dart';
import 'package:job_finder_app/screens/admin/pages/jobslist.dart';
import 'package:job_finder_app/screens/admin/pages/users.dart';
import 'package:job_finder_app/screens/auth/login.dart';
import 'package:job_finder_app/screens/auth/signup.dart';
import 'package:job_finder_app/screens/users/pages/changepassword.dart';
import 'package:job_finder_app/screens/users/pages/home.dart';
import 'package:job_finder_app/screens/users/pages/upliedjobs.dart';

import 'package:job_finder_app/screens/welcome/welcome.dart';

Route<dynamic> generate(RouteSettings routes) {
  switch (routes.name) {
    case WelcomeScreen.pagename:
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    case LoginScreen.pagename:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case ChangepasswordScreen.pagename:
      return MaterialPageRoute(builder: (_) => const ChangepasswordScreen());
    case SignUpScreen.pagename:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case UpliedjobsScreen.pagename:
      return MaterialPageRoute(builder: (_) => const UpliedjobsScreen());
    case HomeScreen.pagename:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AdminDashboard.pagename:
      return MaterialPageRoute(builder: (_) => const AdminDashboard());
    case AdminJobsScreen.pagename:
      return MaterialPageRoute(builder: (_) => const AdminJobsScreen());
    case AdminCategories.pagename:
      return MaterialPageRoute(builder: (_) => const AdminCategories());
    case AdminUsers.pagename:
      return MaterialPageRoute(builder: (_) => const AdminUsers());

    default:
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
  }
}
