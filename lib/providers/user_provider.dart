import 'package:flutter/material.dart';
import 'package:parklink/module/user.dart';
import 'package:parklink/repository/auth_repository.dart';

class UserProvider with ChangeNotifier{

  UserProvider._(AuthRepository auth) : authRepository= auth;
  factory UserProvider(AuthRepository auth)=> UserProvider._(auth);

  final AuthRepository authRepository;
  User? user;

  void notifyAll() => notifyListeners();
}