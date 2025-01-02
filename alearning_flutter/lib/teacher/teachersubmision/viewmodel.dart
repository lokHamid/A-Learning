


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../../Student/Studentdashboard/course.dart';
import '../teacher_assignment_view/Studentsolution/model.dart';
import '../teacherassignmantsmnage/model.dart';
import 'model.dart';


class Teachersubvm extends ChangeNotifier{
  List<assignofstudent> _assigns=[];
  bool isloadingass=false;
  List<solution> solution1=[];
  List<assignofstudent> get assigns=>_assigns;
  List<assignment> assignments=[];
  bool isLoding=true;

  List<Course> courses=[];
  Future<void> Fetchdata(int id)async {
    Uri url=Uri.parse('http://localhost:8080/api/course/user/$id');
    try{
      final response =await http.get(url,
          headers: {
            'Accept':'application/json'
          }
      );
      final data=jsonDecode(response.body);
      courses=(data as List).map((course) => Course.fromJson(course)).toList();

    }catch(e){
      print(e);
    }
    notifyListeners();
  }
   Future<void> Fethdata(int id)async {
   await Fetchdata(id);
    for(int i=0;i<courses.length;i++){
     await Fetchassign(courses[i].courseID);
    }
    if(assignments.isNotEmpty){
      for(int i=0;i<assignments.length;i++){
        print(assignments[i].pwid);
       await fetchSolution(assignments[i].pwid);
      }
      for(int i=0;i<solution1.length;i++){
        print(solution1[i].solution1);
        print(solution1[i].pwname);
      }
    }
     notifyListeners();
   }
  Future<void> fetchSolution(int pwid) async {
    Uri url = Uri.parse('http://localhost:8080/api/solution/all/$pwid');

    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Case 1: If the response body is empty or an unexpected format
        if (data is List && data.isEmpty) {
          print("No solutions available or the response body is empty.");
          isLoding = false;
          notifyListeners();
          return;  // Early return if the list is empty
        }

        // Case 2: If the response body contains valid solution data
        if (data is List) {
          List<solution> fetchedSolutions = data
              .map((item) => solution.fromJson(item))
              .toList();

          // Append the new solutions to the existing list
          solution1.addAll(fetchedSolutions);
          isLoding = false;
          notifyListeners();
        } else {
          print("Unexpected JSON format: $data");
          isLoding = false;
          notifyListeners();
        }
      } else {
        isLoding = false;
        notifyListeners();
        throw Exception('Failed to load solution');
      }
    } catch (e) {
      isLoding = false;
      notifyListeners();
      print('Error fetching solution: $e');
    }
  }


  Future<void> Fetchassign(String courseid) async{
    final urla =Uri.parse("http://localhost:8080/api/pw/$courseid");

    try{
      final status=await http.get(urla,
          headers: {
            'Accept':'application/json'
          }
      );
      if (status.statusCode==200) {
        final data=jsonDecode(status.body);
        print("succsess: $data");
        List<assignment> assi=(data as List).map((assignmen)=>assignment.fromJson(assignmen)).toList();
        assignments.addAll(assi);
        isloadingass=false;
        notifyListeners();
      }else{
        isloadingass=false;
        notifyListeners();
      }
    }catch(e){
      print("1error"+e.toString());
      isloadingass=false;
      notifyListeners();
    }
  }
  }


