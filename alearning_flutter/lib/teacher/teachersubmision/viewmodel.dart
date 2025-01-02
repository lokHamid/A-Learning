


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
  bool isLoding=false;

   Future<void> Fethdata(List<Course> course)async {
    for(int i=0;i<course.length;i++){
     await Fetchassign(course[i].courseID);
    }
    if(assignments.isNotEmpty){
      for(int i=0;i<assignments.length;i++){
       await fetchSolution(assignments[i].pwid);
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

        if (data is Map && data['data'] is List) {
          List<solution> fetchedSolutions =
          (data['data'] as List).map((item) => solution.fromJson(item)).toList();

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


