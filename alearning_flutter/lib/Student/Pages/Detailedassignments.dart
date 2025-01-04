import 'package:a_learning/Student/AssignmentsDeatails/Viewmodel.dart';
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AssignmentsDeatails/View_1.dart';
class Detailedassignments extends StatelessWidget {
 final assignment assign;
 final int iduser;
  const Detailedassignments({super.key, required this.assign, required this.iduser});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final details = Details();
        details.setassign(assign); // Set the assignment data here
        return details; // Return the same instance of Details
      },
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: 28),
                      onPressed: () {
                        Navigator.pop(context); // Go back to the previous screen
                      },
                    ),
                  ],
                ),
              ),
              AssignmentsDetails1(asign1: assign,iduser: iduser,)
            ],
          ),
        ),
      ),
    );
  }
}
