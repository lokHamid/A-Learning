import 'dart:convert';

import 'package:a_learning/User.dart';
import 'package:a_learning/widgets/Chipchoice/View.dart';
import 'package:a_learning/widgets/Chipchoice/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../widgets/Chipchoice/Viewmodel.dart';
class Adminmanager extends ChangeNotifier {
  List<User> users = [];
  late User newuser;
  int? studentsnumber;
  int? feedn;
  String? selectedLevel;
  void setSelectedLevel(String level) {
    selectedLevel = level;
    notifyListeners(); // Notify listeners about the change
  }
  int? sub;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
bool teacher=true;
  bool isloadingn = true;
  bool isloadingf = true;
  bool isloadings = true;
  bool islodingu = true;
  List<User> felters = [];
  final List<String> roles = ['TEACHER', 'STUDENT'];
  final List<String> Assigns = ['TEACHER', 'STUDENT', 'ADMIN'];
  final List<String> levels=['NONE','ING1','ING2','ING3','L1','L2','L3'];

  Fetch() async{
   await Studentnum();
   await feed();
   await subm();

    await Fetchuser();

    notifyListeners();
  }





  void filteru(List<Choice> choice) {
    // Start by resetting the users to the full list of felters
    users = List.from(felters);

    for (int i = 0; i < choice.length; i++) {
      if (choice[i].selected == 1) {
        // Filter users based on role
        users = users.where((user) {
          return user.role
              .toString()
              .split('.')
              .last == choice[i].choice;
        }).toList();
      }
    }
    notifyListeners(); // Trigger rebuild of UI
  }

  TextEditingController search = TextEditingController();

  Widget determinrole(String role) {
    if (role == 'TEACHER') {
      return Padding(padding: EdgeInsets.only(
          right: 4, left: 4,
          top: 8, bottom: 8
      ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromRGBO(232, 245, 233, 1)
          ),
          child: Padding(padding: EdgeInsets.all(12),
            child: Text('Teacher', style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(46, 125, 50, 1)
            ),),
          ),
        ),
      );
    } else {
      return Padding(padding: EdgeInsets.only(
          right: 4, left: 4,
          top: 8, bottom: 8
      ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromRGBO(227, 242, 253, 1)
          ),
          child: Padding(padding: EdgeInsets.all(12),
            child: Text('Student', style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(21, 101, 192, 1)
            ),),
          ),
        ),
      );
    }
  }

  Future<void> Studentnum() async {
    final url = Uri.parse('http://localhost:8080/api/user/studentnumber');
    try {
      final status = await http.get(url, headers: {'Accept': 'application/json'});

      if (status.statusCode == 200) {
        // Directly parse the response body to an integer
        studentsnumber = int.parse(status.body); // Parse directly as an integer
        isloadingn = false;
        notifyListeners();
      } else {
        print('Failed with status: ${status.statusCode}');
        isloadingn = false;
        notifyListeners();
      }
    } catch (e) {
      isloadingn = false;
      print('Error: $e');
      notifyListeners();
    }
  }


  Future<void> feed() async {
    final url = Uri.parse('http://localhost:8080/api/feedback/count');
    try {
      final status = await http.get(url, headers: {'Accept': 'application/json'});

      if (status.statusCode == 200) {
        // Directly parse the response body to an integer
        feedn = int.parse(status.body); // Parse directly as an integer
        isloadingf = false;
        notifyListeners();
      } else {
        print('Failed with status: ${status.statusCode}');
        isloadingf = false;
        notifyListeners();
      }
    } catch (e) {
      isloadingf = false;
      print('Error: $e');
      notifyListeners();
    }
  }

  Future<void> subm() async {
    final url = Uri.parse('http://localhost:8080/api/solution/submission/count');
    try {
      final status = await http.get(url, headers: {'Accept': 'application/json'});

      if (status.statusCode == 200) {
        // Directly parse the response body to an integer
        sub = int.parse(status.body); // Parse directly as an integer
        isloadings = false;
        notifyListeners();
      } else {
        print('Failed with status: ${status.statusCode}');
        isloadings = false;
        notifyListeners();
      }
    } catch (e) {
      isloadings = false;
      print('Error: $e');
      notifyListeners();
    }
  }

  Future<void> Fetchuser() async {
    final url = Uri.parse('http://localhost:8080/api/user/all');
    try {
      final status = await http.get(url, headers: {'Accept': 'application/json'});

      if (status.statusCode == 200) {
        final List data = jsonDecode(status.body); // Decoding response as List
        users = data.map((toElement) => User.fromJson(toElement)).toList(); // Mapping JSON to User objects
        felters = List.from(users);  // Ensure `felters` is initialized from `users`
        islodingu = false;
      } else {
        print('Failed with status: ${status.statusCode}');
        islodingu = false;
      }
      notifyListeners();
    } catch (e) {
      islodingu = false;
      print('Error: $e');
      notifyListeners();
    }
  }




  Future<void> delete(int i, int id) async {
    final url = Uri.parse('http://localhost:8080/api/user/delete/$id'); // Correct URL format
    try {
      final response = await http.delete(
        url,
        headers: {

          'Content-Type': 'application/json', // Example header
        },
      );

      if (response.statusCode == 204) {
        // Handle success: Remove the user from the list if the deletion is successful
        users.removeAt(i);
        felters.removeAt(i);
        Fetch();
        notifyListeners();
      } else {

       print('faild'+response.statusCode.toString()); // Handle failure: You can show an error message based on response.statusCode
        throw Exception('Failed to delete user. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error, e.g. show a message or log the error
      print('Error deleting user: $e');
    }
  }


  void filter(String value,TextEditingController s) {
   users=List.from(felters);
    felters.clear();
    if (s.text.isEmpty) {
       Fetchuser();
       notifyListeners();
    } else {
      for (int i = 0; i < users.length; i++) {
        if (users[i].fullname.contains(value)) {
          felters.add(users[i]);
        }
      }
    }
    notifyListeners();
  }

  Future<void> addUser() async {
    final url = Uri.parse('http://localhost:8080/api/user/add');

    try {
      final status = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(newuser.toJson()),
      );

      if (status.statusCode == 200) {
        Fetch();
        studentsnumber=(studentsnumber!+1);
        print('Success for new user');
      } else {
        print('Failed with status code: ${status.statusCode}');
        print('Response body: ${status.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
