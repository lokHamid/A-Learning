import 'dart:convert';

import 'package:a_learning/User.dart';
import 'package:a_learning/widgets/Chipchoice/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Adminmanager extends ChangeNotifier {
  List<User> users = [];
  int? studentsnumber;
  int? feedn;
  int? sub;
  bool isloadingn = true;
  bool isloadingf = true;
  bool isloadings = true;
  bool islodingu=true;
  List<User> felters=[];
  final List<String> roles = ['Teacher', 'Student'];
  final List<String> Assigns = ['Teacher', 'Student','Admin'];
Fetch(){
  studentsnumber=154;
  feedn=108;
  sub=57;
  users.add(User(fullname: 'akram', email: 'zennadakram@gmail.com', password: '16639', role: Role.Student, userid: 105, username:'Krimo'));
  users.add(User(fullname: 'abdo', email: 'gvvfhdsg', password: '16639', role: Role.Teacher , userid: 105, username:'Krimo'));
  users.add(User(fullname: 'akram', email: 'dxshgqwgj,', password: '16639', role: Role.Student, userid: 105, username:'Krimo'));
  felters=users;
  notifyListeners();

}
  void filteru(List<Choice> choice) {
    // Start by resetting the users to the full list of felters
    users = List.from(felters);

    for (int i = 0; i < choice.length; i++) {
      if (choice[i].selected == 1) {
        // Filter users based on role
        users = users.where((user) {
          return user.role.toString().split('.').last == choice[i].choice;
        }).toList();
      }
    }
    notifyListeners(); // Trigger rebuild of UI
  }

  TextEditingController search=TextEditingController();
Widget determinrole(String role){
  if(role=='Teacher'){
    return Padding(padding: EdgeInsets.only(
      right: 4,left: 4,
      top: 8,bottom: 8
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(232, 245, 233,1)
      ),
      child: Padding(padding: EdgeInsets.all(12),
      child: Text('Teacher',style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
          color: Color.fromRGBO(46, 125,50,1)
      ),),
      ),
    ),
    );
  }else{

      return Padding(padding: EdgeInsets.only(
          right: 4,left: 4,
          top: 8,bottom: 8
      ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromRGBO(227, 242, 253,1)
          ),
          child: Padding(padding: EdgeInsets.all(12),
            child: Text('Student',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(21, 101,192,1)
            ),),
          ),
        ),
      );
    }

}
  Future<void> Studentnum() async {
    final url = Uri.parse('http://localhost/8080');
    try {
      final status = await http.get(url,
          headers: {
            'Accept': 'application/json'
          }
      );
      if (status.statusCode == 200) {
        final data = jsonDecode(status.body);
        studentsnumber = data['studentsNumber'];
        isloadingn = false;
        notifyListeners();
      } else {
        print('failed');
        isloadingn = false;
        notifyListeners();
      }
    } catch (e) {
      isloadingn = false;
      print('error');
      notifyListeners();
    }
  }

  Future<void> feed() async {
    final url = Uri.parse('http://localhost/8080');
    try {
      final status = await http.get(url,
          headers: {
            'Accept': 'application/json'
          }
      );
      if (status.statusCode == 200) {
        final data = jsonDecode(status.body);
        feedn = data['feedbacknumber'];
        isloadingf = false;
        notifyListeners();
      } else {
        print('failed');
        isloadingf = false;
        notifyListeners();
      }
    } catch (e) {
      isloadingf = false;
      print('error');
      notifyListeners();
    }
  }

  Future<void> subm() async {
    final url = Uri.parse('http://localhost/8080');
    try {
      final status = await http.get(url,
          headers: {
            'Accept': 'application/json'
          }
      );
      if (status.statusCode == 200) {
        final data = jsonDecode(status.body);
        feedn = data['submissionnumber'];
        isloadings = false;
        notifyListeners();
      } else {
        print('failed');
        isloadings = false;
        notifyListeners();
      }
    } catch (e) {
      isloadings = false;
      print('error');
      notifyListeners();
    }
  }

  Future<void> Fetchuser() async {
    final url = Uri.parse('http://localhost/8080');
    try {
      final status = await http.get(url,
          headers: {
            'Accept': 'application/json'
          }
      );
      if (status.statusCode == 200) {
        final data = jsonDecode(status.body);
        users=(data as List).map((toElement)=>User.fromJson(toElement)).toList();
        felters=users;
       islodingu=false;
        notifyListeners();
      } else {
        print('failed');
        islodingu=false;
        notifyListeners();
      }
    } catch (e) {
      islodingu=false;
      print('error');
      notifyListeners();
    }
  }
Future<void> delete(int i)async {
  users.removeAt(i);
  notifyListeners();
}
  void filter(String value){
    users.clear();
    if(value.isEmpty){
      users=felters;
    }else {
      for (int i = 0; i < felters.length; i++) {
        if (felters[i].fullname.contains(value)) {
          users.add(felters[i]);
        }
      }
    }
    notifyListeners();
  }
}