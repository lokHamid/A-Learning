import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Teachersolvm extends ChangeNotifier {
   solution? _solution;
  bool _isLoading = true; // Add loading state

  solution? get solutions => _solution;
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
        _solution = solution.fromJson(data);
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
