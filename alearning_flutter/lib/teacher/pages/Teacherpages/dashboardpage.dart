import 'package:a_learning/teacher/teacher%20course/view.dart';
import 'package:a_learning/teacher/teachersubmision/view.dart';
import 'package:a_learning/widgets/dashboardcontainer.dart';
import 'package:flutter/material.dart';
class teacherdachbord extends StatelessWidget {
  final int id;
  final String name;
  const teacherdachbord({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            dashboardcontainer(title: "Teacher Dashboard", description: "Manage your  and student submissions"),
            SizedBox(height: 15,),
            Viewt(id: id,),
            SizedBox(height: 15,),
            Viewsubmit(),
          ],
        ),
      ) ,
      backgroundColor: Color.fromRGBO(241, 244, 248, 1),

    );
  }
}
