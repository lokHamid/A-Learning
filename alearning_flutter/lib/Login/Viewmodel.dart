import 'package:a_learning/Admin/Page/AdminPage.dart';
import 'package:a_learning/Student/Pages/dashboard.dart';
import 'package:a_learning/teacher/pages/Teacherpages/dashboardpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Loginmanager extends ChangeNotifier{
TextEditingController t1=TextEditingController();
TextEditingController t2=TextEditingController();
Future<void> check() async{

}
void checktest(BuildContext context){
  if(t1.text.isNotEmpty) {
    if (t1.text == 'Admin') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Adminpage()));
    } else {
      if (t1.text == 'Teacher') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => teacherdachbord()));
      } else {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Dashboards(studentID: '26')));
      }
    }
  }
}
}