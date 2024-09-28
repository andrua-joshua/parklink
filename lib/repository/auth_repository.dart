import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:parklink/module/user.dart';

class AuthRepository{


  Future<User?> login({
    required String email,
    required String password
  }) async{
    final uri = Uri.parse("http://154.72.206.212:5000/api/v2/auth/login");
    // final uri = Uri.parse("http://localhost:5000/api/v1/auth/login");

    final payload = {
      "email": email,
      "password": password
    };

    try{

      final res = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(payload)
      );

      if(res.statusCode == 200){
        final data = jsonDecode(res.body);
        return User.fromJson(data);
      }else if(res.statusCode == 401){
        Fluttertoast.showToast(msg: "Wrong password"); 
      }else if(res.statusCode == 404){
        Fluttertoast.showToast(msg: "User not found"); 
      }else{
        Fluttertoast.showToast(msg: "Failed to login"); 
      }

    }catch(e){
      print("Error logging in:  $e");
      Fluttertoast.showToast(msg: "Error logging in"); 
    }
  }

  Future<User?> fetchUser({
    required int userId,
  }) async{
    final uri = Uri.parse("http://154.72.206.212:5000/api/v2/auth/fetchUser/$userId");
    // final uri = Uri.parse("http://localhost:5000/api/v1/auth/fetchUser/$userId");

  

    try{

      final res = await http.get(
        uri,
      );

      if(res.statusCode == 200){
        final data = jsonDecode(res.body);
        return User.fromJson(data);
      }else{
        Fluttertoast.showToast(msg: "Failed to fetch user"); 
      }

    }catch(e){
      print("Error fetching user:  $e");
      Fluttertoast.showToast(msg: "Failed to fetch user"); 
    }
  }



  Future<User?> signup({
    required String username,
    required String email,
    required String password
  }) async{
    final uri = Uri.parse("http://154.72.206.212:5000/api/v2/auth/signup");
    // final uri = Uri.parse("http://localhost:5000/api/v1/auth/signup");

    final payload = {
      "email": email,
      "username": username,
      "password": password
    };

    try{

      final res = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(payload)
      );

      if(res.statusCode == 200){
        final data = jsonDecode(res.body);
        return User.fromJson(data);
      }else if(res.statusCode == 401){
        Fluttertoast.showToast(msg: "Wrong password"); 
      }else if(res.statusCode == 404){
        Fluttertoast.showToast(msg: "User not found"); 
      }else{
        Fluttertoast.showToast(msg: "Failed to login"); 
      }

    }catch(e){
      print("Error logging in:  $e");
      Fluttertoast.showToast(msg: "Error logging in"); 
    }
  }
}