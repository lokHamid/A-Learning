import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../teacher/teacherassignmantsmnage/model.dart';
class Studentassign extends ChangeNotifier{
  List<assignment> assignments=[];
  bool isloadingass=true;

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
        assignments=(data as List).map((assignmen)=>assignment.fromJson(assignmen)).toList();
        isloadingass=false;
        notifyListeners();
      }else{
        isloadingass=false;
        notifyListeners();
      }
    }catch(e){
      print("1error"+e.toString());
      isloadingass=false;
      notifyListeners();
    }
  }
  Widget assigndeadline(DateTime? t){

    DateTime now=DateTime.now();
    if(t==null) {
      return Text('');

    }else{
      String format=DateFormat('MMMM d, y').format(t);
      if (now.isAfter(t) || t.isAtSameMomentAs(now)) {
        return Text('Due:'+format,style:TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 89, 99,1)
        ) ,);

      }else{
        DateTime twoDaysBefore = t.subtract(Duration(days: 2));
        DateTime tday=now.subtract(Duration(days: 3));
        if(now.isBefore(t) && now.isAfter(twoDaysBefore)){
          return Text('Due:'+format,style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color.fromRGBO(249, 207, 88,1)
          ),);
        }else{
          return Text('Due:'+format,style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(36, 150,137,1)
          ),);
        }
      }

    }
  }
  void Fetch(){
    assignments.add(assignment(pwid: 1785, pwname: 'Intro to Python', steps:'add me',objectives: 'Learn basics of python',submissiondeadline: DateTime.now().add(Duration(days: 0))));
    assignments.add(assignment(pwid: 1785, pwname: 'Intro to Python', steps:'add me',objectives: 'Learn basics of python',submissiondeadline: DateTime.now().add(Duration(days: 1))));
    assignments.add(assignment(pwid: 1785, pwname: 'Intro to Python', steps:'add me',objectives: 'Learn basics of python',submissiondeadline: DateTime.now().add(Duration(days: 5))));
    isloadingass=false;
    notifyListeners();
  }
}
