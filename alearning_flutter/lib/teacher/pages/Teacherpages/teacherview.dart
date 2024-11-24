import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/view.dart';
import 'package:a_learning/teacher/teacher_assignment_view/teacher_feedback/view.dart';
import 'package:a_learning/widgets/dashboardcontainer.dart';
import 'package:flutter/material.dart';
class Teacherview extends StatelessWidget {
  final String student;
  final int id;
  final String course;
  const Teacherview({super.key,required this.student,required this.id, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 244, 248, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            dashboardcontainer(title: student, description:course ),
            SizedBox(height: 8,),
            Teachersolview(),
            SizedBox(height: 8,),
            Teacherfeedbackview(),
          ],
        ),
      ),
    );
  }
}
