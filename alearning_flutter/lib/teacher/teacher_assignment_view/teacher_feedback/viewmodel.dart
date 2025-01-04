import 'dart:convert';

import 'package:a_learning/teacher/teacher_assignment_view/teacher_feedback/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Techerfeedmv extends ChangeNotifier{
  late Feedbacka _feedback;
  double slider=0.0;
  void update(double value){
    slider=value;
    notifyListeners();
  }
  Future<void> updateFeedback(int idSolution, Feedbacka feedback) async {
    final url = Uri.parse('http://localhost:8080/api/solution/update-feedback/$idSolution');


    final body = json.encode(feedback.toJson());
    print(body);

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonResponse = json.decode(response.body);
       Feedbacka.fromJson(jsonResponse);

    } else {
      throw Exception('Failed to update feedback: ${response.statusCode}');
    }
  }




}