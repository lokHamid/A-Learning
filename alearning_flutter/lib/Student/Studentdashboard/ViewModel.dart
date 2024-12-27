import 'dart:convert';

import 'package:a_learning/Student/Studentdashboard/course.dart';
import 'package:a_learning/User.dart';
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class Studentdashboard extends ChangeNotifier{
  List<Course> courses=[];
  List<assignment> assignments=[];
  bool isloadingass=true;
  bool isloading=true;

  Future<void> Fetchcourses(Level level) async {
    final url = Uri.parse("http://localhost:8080/api/course/student_courses/${level.toString().split('.').last}");

    try {
      final status = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (status.statusCode == 200) {
        final data = jsonDecode(status.body);
        print(data);
        courses = (data as List).map((course) => Course.fromJson(course)).toList();
        isloading = false;
        notifyListeners();
      } else {
        isloading = false;
        notifyListeners();
      }
    } catch (e) {
      isloading = false;
      print('error for request: ' + e.toString());
      notifyListeners();
    }
  }

  Future<void> Fetchassign() async{
    final urla =Uri.parse("http://localhost:8080/api/pw/ITP");

    try{
      final status=await http.get(urla,
      headers: {
        'Accept':'application/json'
      }
      );
      if (status.statusCode==200) {
        final data=jsonDecode(status.body);
        print("succsess: $data");
        assignments=(data as List).map((assignmen)=>assignment.fromJson(assignmen)).toList();
        isloadingass=false;
        notifyListeners();
      }else{
        isloadingass=false;
        notifyListeners();
      }
    }catch(e){
print("error"+e.toString());
isloadingass=false;
notifyListeners();
    }
  }
  Widget assigndeadline(DateTime? t){

DateTime now=DateTime.now();
if(t==null) {
  return Text('');

}else{
  String format=DateFormat('MMMM d, y').format(t);
  if (now.isAfter(t) || t.isAtSameMomentAs(now)) {
   return Text('Due:'+format,style:TextStyle(
     fontSize: 12,
     fontWeight: FontWeight.w400,
       color: Color.fromRGBO(255, 89, 99,1)
   ) ,);

  }else{
    DateTime twoDaysBefore = t.subtract(Duration(days: 2));
    DateTime tday=now.subtract(Duration(days: 3));
    if(now.isBefore(t) && now.isAfter(twoDaysBefore)){
    return Text('Due:'+format,style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color.fromRGBO(249, 207, 88,1)
    ),);
    }else{
      return Text('Due:'+format,style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(36, 150,137,1)
      ),);
    }
  }
 
}
  }
void Fetch(){
    courses.add(Course(coursename: "POO", courseID: 'asd', coef:6, level:Level.ING1, teacher: 'Draa',teacherID: 1));
    courses.add(Course(coursename: "POO", courseID: 'asd', coef:6, level:Level.ING1, teacher: 'Draa',teacherID: 1));
    courses.add(Course(coursename: "POO", courseID: 'asd', coef:6, level:Level.ING1, teacher: 'Draa',teacherID: 1));
    courses.add(Course(coursename: "POO", courseID: 'asd', coef:6, level:Level.ING1, teacher: 'Draa',teacherID: 1));
    courses.add(Course(coursename: "POO", courseID: 'asd', coef:6, level:Level.ING1, teacher: 'Draa',teacherID: 1));
    courses.add(Course(coursename: "POO", courseID: 'asd', coef:6, level:Level.ING1, teacher: 'Draa',teacherID: 1));
    assignments.add(assignment(pwid: 1785, pwname: 'Intro to Python', steps:'add me',objectives: 'Learn basics of python',submissiondeadline: DateTime.now().add(Duration(days: 0))));
    assignments.add(assignment(pwid: 1785, pwname: 'Intro to Python', steps:'add me',objectives: 'Learn basics of python',submissiondeadline: DateTime.now().add(Duration(days: 2))));
    assignments.add(assignment(pwid: 1785, pwname: 'Intro to Python', steps:'add me',objectives: 'Learn basics of python',submissiondeadline: DateTime.now().add(Duration(days: 5))));
    isloading=false;
    isloadingass=false;
    notifyListeners();
}
}