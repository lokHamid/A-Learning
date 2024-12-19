import 'package:a_learning/Student/Student-assignments/View.dart';
import 'package:a_learning/widgets/dashboardcontainer.dart';
import 'package:flutter/material.dart';
class Courseassignments extends StatelessWidget {
  final String coursename;
  final String studentID;
  const Courseassignments({super.key, required this.coursename, required this.studentID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255,255,255,1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            dashboardcontainer(title: coursename, description:'Assignments'),
            SizedBox(height: 24,),
            Padding(padding: EdgeInsets.only(left: 24,
            right: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Studentassi(studentID: studentID),

                SizedBox(height: 20,)
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
