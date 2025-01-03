import 'dart:convert';

import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Teacherassignments extends ChangeNotifier{
List<assignment> assign=[];
TextEditingController t1=TextEditingController();
TextEditingController t2=TextEditingController();
TextEditingController t3=TextEditingController();
TextEditingController t4=TextEditingController();
void change(TextEditingController t,String s){
  t.text=s;
  notifyListeners();
}
Future<void> changes(String id, int index) async {
  // Update the local state first
  assign[index].pwname = t1.text;
  assign[index].objectives = t2.text;
  assign[index].steps = t3.text;
  assign[index].materials = t4.text;
  assign[index].file=[];
  Map<String, dynamic> updatedPw = assign[index].toJson();
   // or some other date// Example update

  // Send the PUT request to the backend API
  final response = await http.put(
    Uri.parse('http://localhost:8080/api/pw/update/$id'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(updatedPw),

  );

  if (response.statusCode == 200) {
    print('Pw updated successfully');
    notifyListeners();

  } else {
    print('Failed to update Pw: ${response.statusCode}');
  }
}

  bool isloading=true;
  Future<void> Removedata(int id,int index) async{
    final url=Uri.parse("http://localhost:8080/api/pw/delete/$id");

    try{
      final response=await http.delete(url);
      if (response.statusCode == 200 || response.statusCode == 204) {

        print('Resource deleted successfully.');
        assign.removeAt(index);
        notifyListeners();
      } else {
        print('Failed to delete resource. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }catch(e){
      print('An error occurred: $e');
    }
  }
Future<void> Fetchassign(String courseid) async{
  final urla =Uri.parse("http://localhost:8080/api/pw/$courseid");

  try{
    final status=await http.get(urla,
        headers: {
          'Accept':'application/json'
        }
    );
    if (status.statusCode==200) {
      final data=jsonDecode(status.body);
      print("succsess: $data");
      assign=(data as List).map((assignmen)=>assignment.fromJson(assignmen)).toList();

      isloading=false;
      notifyListeners();
    }else{
      isloading=false;
      notifyListeners();
    }
  }catch(e){
    print("1error"+e.toString());
    isloading=false;
    notifyListeners();
  }
}
Future<void> Fetchdatat() async {
  // Simulate a loading state
  isloading = true;
  notifyListeners();


  await Future.delayed(Duration(seconds: 2)); // Simulate a small delay
  assign.add(assignment(pwid: 100, pwname: "Introduction to Python", steps: "ghfg", objectives: "to learn basic concepts in python", ));
  assign.add(assignment(pwid: 1010, pwname: "Data Structures in C++", steps: "ghfg", ));

  // Stop the loading state and notify listeners
  isloading = false;
  notifyListeners();
}
}
