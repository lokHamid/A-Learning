import 'dart:convert';

import 'package:a_learning/Student/Studentdashboard/course.dart';
import 'package:a_learning/teacher/teacher%20course/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Teachercourseviewmodel extends ChangeNotifier{
List<Course> _courses=[];
List<Course> get courses=>_courses;
Future<void> Fetchdata(int id)async {
  Uri url=Uri.parse('http://localhost:8080/api/course/user/$id');
 try{
   final response =await http.get(url,
   headers: {
     'Accept':'application/json'
   }
   );
   final data=jsonDecode(response.body);
   _courses=(data as List).map((course) => Course.fromJson(course)).toList();

 }catch(e){
   print(e);
 }
  notifyListeners();
}
}