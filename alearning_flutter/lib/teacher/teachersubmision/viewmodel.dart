import 'package:a_learning/teacher/teachersubmision/model.dart';
import 'package:flutter/material.dart';
class Teachersubvm extends ChangeNotifier{
  List<assignofstudent> _assigns=[];
  List<assignofstudent> get assigns=>_assigns;
   void Fethdata(){
     _assigns=[
     assignofstudent("John Doe", "Intro to Programming - PW1", "Submitted"),
     assignofstudent("Jane Smith", "Web Dev Fundamentals - PW2", "Late"),
    ];
     notifyListeners();
   }
}