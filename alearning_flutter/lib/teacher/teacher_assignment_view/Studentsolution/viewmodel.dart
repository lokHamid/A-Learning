import 'dart:convert';
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:http/http.dart' as http;

import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Teachersolvm extends ChangeNotifier {
  List<solution>? solution1;
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

  Future<void> fetchSolution() async {
    const String url = 'http://localhost:8080/api/solution/getSolution';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',  // Add this header
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        solution1 = (data as List).map((solutio) => solution.fromJson(solutio)).toList();

        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Failed to load solution');
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print('Error fetching solution: $e');
    }
  }

}
