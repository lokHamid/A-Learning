import 'package:a_learning/teacher/teacher%20course/model.dart';
import 'package:flutter/material.dart';
class Teachercourseviewmodel extends ChangeNotifier{
List<Teachercourse> _courses=[];
List<Teachercourse> get courses=>_courses;
void Fetchdata(){
  _courses = [
  Teachercourse("SE2", "Software Engineering 2",28, 4 , "ING3" , i:Icon(Icons.computer)  ),
    Teachercourse("Ana3", "Analysis 3",35, 6 , "ING2" , i:Icon(Icons.calculate) ),
    Teachercourse("CA", "Computer Architecture",38, 5 , "ING1" , i:Icon(Icons.architecture_outlined) )
  ];
  notifyListeners();
}
}