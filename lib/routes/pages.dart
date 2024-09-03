import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/admin/pages/addcategory.dart';
import 'package:job_finder_app/screens/admin/pages/addsubcategory.dart';
import 'package:job_finder_app/screens/admin/pages/categories.dart';
import 'package:job_finder_app/screens/admin/pages/companies.dart';
import 'package:job_finder_app/screens/admin/pages/dashbord.dart';
import 'package:job_finder_app/screens/admin/pages/jobslist.dart';
import 'package:job_finder_app/screens/admin/pages/subcategories.dart';
import 'package:job_finder_app/screens/admin/pages/users.dart';
import 'package:job_finder_app/screens/agents/pages/agentapplicants.dart';
import 'package:job_finder_app/screens/agents/pages/agentjobs.dart';
import 'package:job_finder_app/screens/agents/pages/agentpostjob.dart';
import 'package:job_finder_app/screens/agents/pages/agentprofile.dart';
import 'package:job_finder_app/screens/agents/pages/agentshomepage.dart';
import 'package:job_finder_app/screens/agents/pages/agentupdatejob.dart';
import 'package:job_finder_app/screens/auth/pages/login.dart';
import 'package:job_finder_app/screens/auth/pages/signup.dart';
import 'package:job_finder_app/screens/users/pages/changepassword.dart';
import 'package:job_finder_app/screens/users/pages/home.dart';
import 'package:job_finder_app/screens/users/pages/update_profile.dart';
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
    case AdminCompanies.pagename:
      return MaterialPageRoute(builder: (_) => const AdminCompanies());
    case AdminSubCategories.pagename:
      return MaterialPageRoute(builder: (_) => const AdminSubCategories());
    case AdminAddSubCategory.pagename:
      return MaterialPageRoute(builder: (_) => const AdminAddSubCategory());
    case AdminAddCategory.pagename:
      return MaterialPageRoute(builder: (_) => const AdminAddCategory());
    case Agentshomepage.pagename:
      return MaterialPageRoute(builder: (_) => const Agentshomepage());

    

    case AgentUpdatejob.pagename:
      return MaterialPageRoute(builder: (_) => const AgentUpdatejob());
    case AgentapplicantsPage.pagename:
      return MaterialPageRoute(builder: (_) => const AgentapplicantsPage());
    default:
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
  }
}
