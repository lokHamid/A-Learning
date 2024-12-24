import 'package:a_learning/Student/Studentdashboard/View_1.dart';
import 'package:a_learning/Student/Studentdashboard/View_2.dart';
import 'package:a_learning/User.dart';
import 'package:a_learning/widgets/dashboardcontainer.dart';
import 'package:flutter/material.dart';
class Dashboards extends StatelessWidget {
  final int studentID;
  final Level level;
  const Dashboards({super.key, required this.studentID, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 244, 248,1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            dashboardcontainer(title: 'Practical Work Assignments', description: 'Your hands-on learning tasks'),
            Padding(padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Studentdash(studentID:studentID,level: level,),
                SizedBox(height: 24,),
                Recent(studentID: studentID,)
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
