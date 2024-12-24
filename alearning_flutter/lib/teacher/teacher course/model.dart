import 'package:flutter/cupertino.dart';

class Teachercourse{
  String id_course; // springboot
  String description; // springboot
  int studentsnumber;
  int coefficient;  // springboot
  String level; // springboot
  Icon i;
  Teachercourse(this.id_course,this.description,this.studentsnumber,this.coefficient,this.level,{required this.i});

}