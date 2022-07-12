import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  
  String _fullname = '';
  String get fullname => _fullname;
  set fullname(String newValue) {
    _fullname = newValue;
    notifyListeners();
  }

  String _username = 'admin';
  String get username => _username;
  set username(String newValue) {
    _username = newValue;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;
  set email(String newValue) {
    _email = newValue;
    notifyListeners();
  }

  String _password = 'password';
  String get password => _password;
  set password(String newValue) {
    _password = newValue;
    notifyListeners();
  }
}
