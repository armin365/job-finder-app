import 'package:flutter/material.dart';
import 'package:job_finder_app/models/company_model.dart';

class CompanyProvider extends ChangeNotifier {
  Company companies = Company(
    id: '',
    name: '',
    email: '',
    password: '',
    contactEmail: '',
    contactPhone: 0,
    industry: '',
    description: '',
    location: '',
    logo: '',
    website: '',
  );

  void setcompany(String company) {
    companies = Company.fromJson(company);
    notifyListeners();
  }

  void setFromModel(Company company) {
    companies = company;
    notifyListeners();
  }
}
