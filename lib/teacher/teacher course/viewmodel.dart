import 'package:a_learning/teacher/teacher%20course/model.dart';
import 'package:flutter/material.dart';
class Teachercourseviewmodel extends ChangeNotifier{
List<Teachercourse> _courses=[];
List<Teachercourse> get courses=>_courses;
void Fetchdata(){
  _courses = [
  Teachercourse("Software Engineering2", "ING3",28,i:Icon(Icons.computer)  ),
    Teachercourse("Analysis3", "ING2",35,i:Icon(Icons.calculate) ),
    Teachercourse("Computer Architecture", "ING1",38,i:Icon(Icons.architecture_outlined) )
  ];
  notifyListeners();
}
}