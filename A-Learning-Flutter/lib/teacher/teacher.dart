import 'package:a_learning/teacher/teacherdektab.dart';
import 'package:a_learning/teacher/teachermobile.dart';
import 'package:flutter/material.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: LayoutBuilder(
       builder:(context,constraints){
         if(constraints.maxWidth >600){
           return Teacherdektab();
         }else{
          return Teachermobile();
         }

       }


   ),
    );
  }
}
