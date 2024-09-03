import 'package:flutter/material.dart';
import 'package:job_finder_app/models/usermodel.dart';

class AllusersProvider extends ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;


  void setUsers(List<User> users) {
    _users = users;
    notifyListeners();
  }

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void removeUser(User user) {
    _users.remove(user);
    notifyListeners();
  }

}
