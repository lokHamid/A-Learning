import 'dart:convert';

import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Teacherassignments extends ChangeNotifier{
List<assignment> assign=[];
TextEditingController t1=TextEditingController();
TextEditingController t2=TextEditingController();
TextEditingController t3=TextEditingController();
void change(TextEditingController t,String s){
  t.text=s;
  notifyListeners();
}
Future<void>changes(String id,int index)async {
  assign[index].pwname=t1.text;
  assign[index].objectives=t2.text;
  assign[index].steps=t3.text;
  notifyListeners();

}
  bool isloading=true;
  Future<void> Removedata(String id,int index) async{
    final url=Uri.parse("http://fuck/$id");
    assign.removeAt(index);
    notifyListeners();
    try{
      final response=await http.delete(url);
      if (response.statusCode == 200 || response.statusCode == 204) {
        print('Resource deleted successfully.');
      } else {
        print('Failed to delete resource. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }catch(e){
      print('An error occurred: $e');
    }
  }
 Future<void> Fetchdata() async{
   final Uri url=Uri.parse("http://endpoint");
   try{
final response=await http.get(url,
  headers: {
  'Accept':'application/json'
  }

);
if(response.statusCode==200){
  final data=jsonDecode(response.body);
  notifyListeners();
  isloading=false;
}
print('field');
isloading=false;
notifyListeners();
throw Exception('Failed to load solution');
   }catch(e){
     isloading = false;
     notifyListeners();
     print('Error fetching solution: $e');
   }
 }
Future<void> Fetchdatat() async {
  // Simulate a loading state
  isloading = true;
  notifyListeners();


  await Future.delayed(Duration(seconds: 2)); // Simulate a small delay
  assign.add(assignment(pwid: "100", pwname: "Introduction to Python", steps: "ghfg", objectives: "to learn basic concepts in python"));
  assign.add(assignment(pwid: "1010", pwname: "Data Structures in C++", steps: "ghfg"));

  // Stop the loading state and notify listeners
  isloading = false;
  notifyListeners();
}
}
