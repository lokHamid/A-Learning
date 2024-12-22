
import 'dart:convert';
import 'dart:io';
import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:a_learning/teacher/teacher_assignment_view/teacher_feedback/model.dart';
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class Details extends ChangeNotifier{
 late assignment assign;
  TextEditingController t1=TextEditingController();
   solution? s1;
  Feedbacka? feedback;
  bool isloading=true;
  void controle(TextEditingController t){
  
  }
  Future<void> launchurl(String url)async {
   final Uri uri=Uri.parse(url);
   if (await canLaunchUrl(uri)) {
    await launchUrl(
     uri,
    mode: LaunchMode.inAppBrowserView, // Ensures the URL opens in an external app
    );
   } else {
    throw 'Could not launch $url';
   }
  }
  void setassign(assignment assi){
   assign=assi;
   notifyListeners();
  }
  Widget score(double? grade){
   if(grade==null){
    return Text('');
   }else {
    if (grade > 13) {
     return Text('Overall Score: ' + grade.toString() + '/20', style: TextStyle(
         fontWeight: FontWeight.w600,
         fontSize: 16,
         color: Color.fromRGBO(36, 150, 137, 1)
     ),);
    } else {
     if (grade <= 13 && grade >= 10) {
      return Text(
       'Overall Score: ' + grade.toString() + '/20', style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Color.fromRGBO(249, 208, 88, 1)
      ),);
     }
     else {
      return Text(
       'Overall Score: ' + grade.toString() + '/20', style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Color.fromRGBO(255, 89, 99, 1)
      ),);
     }
    }
   }
  }
  Future<void>pickfile() async{
  final result= await FilePicker.platform.pickFiles(
  allowMultiple: true,
   type: FileType.custom,
   allowedExtensions: ['jpg', 'pdf', 'doc'],
  );
  if (result != null) {
   // Convert the result to a list of Files objects
   final selectedFiles = result.paths
       .where((path) => path != null) // Exclude null paths
       .map((path) => files(
    name: path!.split('/').last, // Extract file name
    url: '', // URL can be updated after upload
    file: File(path), // Store the File object in the `file` attribute
   ))
       .toList();

   print('Selected files: ${selectedFiles.map((f) => f.name).toList()}');
    s1?.pdf=selectedFiles;

  } else {
   print('No files selected');

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
 Widget determinIcon(String? url) {
  if (url == null || url.isEmpty) {
   return Icon(Icons.error, size: 24, color: Colors.grey);  // Return a default icon if url is null or empty
  }

  if (url.contains('youtube')) {
   return Icon(Icons.play_circle, size: 24, color: Color.fromRGBO(255, 89, 99, 1));
  } else if (url.contains('doc')) {
   return Icon(Icons.description, size: 24, color: Color.fromRGBO(75, 57, 239, 1));
  } else {

   return Icon(Icons.book, size: 24, color: Color.fromRGBO(238, 139, 96, 1));
  }
 }
Future<void> sendsolution() async{
   final url=Uri.parse('https://localhost:8080/student/solution');
   final status= await http.post(url,
   headers: {
    'ContentType':'application/json'
   },
    body: jsonEncode(s1?.toJson())
   );
   if(status.statusCode==200){
   print('succeed');
   }else{
    print('failed');
   }
}
 Future<void> Fetchfeedback(String pwid) async{
  final url=Uri.parse('https://localhost:8080/student/solution');
try{
 final status=await http.get(url,
 headers: {
  'Accept':'application/json'
 }
 );
 if(status.statusCode==200){
 final data=jsonDecode(status.body);
 feedback=Feedbacka.fromJson(data);
 isloading=true;
 notifyListeners();
 }else{
isloading=false;
notifyListeners();
 }
}catch(e){
print('error');
isloading=false;
  notifyListeners();
}
  feedback = Feedbacka(grade: 12, message: 'shit');
  notifyListeners();
 }
}