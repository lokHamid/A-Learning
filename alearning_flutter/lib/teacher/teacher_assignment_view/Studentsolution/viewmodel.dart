import 'dart:convert';
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:http/http.dart' as http;

import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Teachersolvm extends ChangeNotifier {
  solution? solution1;
  List<assignment> assignments=[];
  bool isloadingass=false;
  bool _isLoading = true; // Add loading state


  bool get isLoading => _isLoading;

  Future<void> launchURL(String fileId) async {
    final String url = fileId; // URL to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void fetchSolution(solution sol) async {
   solution1=sol;
  }

}
