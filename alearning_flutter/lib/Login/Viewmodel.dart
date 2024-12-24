import 'dart:convert';

import 'package:a_learning/Admin/Page/AdminPage.dart';
import 'package:a_learning/Student/Pages/dashboard.dart';
import 'package:a_learning/teacher/pages/Teacherpages/dashboardpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../User.dart';
class Loginmanager extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading=true;
  User? login;
 bool iscorect=true;
 bool isvisible=false;
 void visible(){
   if(isvisible){
     isvisible=false;
   }else{
     isvisible=true;
   }
   notifyListeners();
 }

  void checktest(BuildContext context) {
    if (login!=null) {
      if (login?.role==Role.ADMIN) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Adminpage()));
      } else {
        if (login?.role==Role.TEACHER) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => teacherdachbord()));
        } else {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Dashboards(studentID: login!.userid,level: login!.level,)));
        }
      }
    }
  }

  Future<void> loginUser(String email, String password) async {
    final url = Uri.parse('http://localhost:8080/api/user/login');

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {

        final responseData = json.decode(response.body);
        print("Login successful, user: $responseData");
        login=User.fromJson(responseData);
        isLoading=false;
        iscorect=true;
        notifyListeners();
        // You can store the user data (e.g., in shared preferences or a local database)
      } else if (response.statusCode == 401) {
        // Unauthorized, invalid credentials
        isLoading=false;
        iscorect=false;
        notifyListeners();
        print("Login failed: Invalid credentials");
      } else {
        // Other errors
        print("Login failed with status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during login: $error");
    }
  }
}