
import 'dart:convert';
import 'dart:io';
import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:a_learning/teacher/teacher_assignment_view/teacher_feedback/model.dart';
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart'; // Import path package

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
 Future<void> pickfile() async {
  try {
   final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'doc'],
   );

   if (result != null) {
    if (kIsWeb) {
     // Web-specific handling
     final selectedFiles = result.files
         .where((file) => file.bytes != null) // Ensure file has byte data
         .map((file) => files(
      name: file.name,
      url: '', // You can update this with the upload URL later
      file: File(''), // You might not need to use a physical file on Web
      idfile: 2,
     ))
         .toList();

     print('Selected files: ${selectedFiles.map((f) => f.name).toList()}');

     s1?.pdf = selectedFiles;
     print(s1?.pdf.length);




     notifyListeners();

    } else {
     // Mobile-specific handling (using paths)
     final selectedFiles = result.paths
         .where((path) => path != null)
         .map((path) => files(
      name: path!.split('/').last,
      url: '', // URL can be updated after upload
      file: File(path),
      idfile: 2,
     ))
         .toList();

     print('Selected files: ${selectedFiles.map((f) => f.name).toList()}');
     s1?.pdf = [];
     s1?.pdf = selectedFiles;
     print(selectedFiles.length);
     for(int i=0;i<s1!.pdf.length;i++){
      print(s1?.pdf[i].name);
     // uploadFileToBackend(s1?.pdf[i].file);
     }
     notifyListeners();

    }
   } else {
    print('No files selected');
   }
  } catch (e) {
   print('Error picking files: $e');
  }
 }
 Future<void> uploadFileToBackend(File file) async {
  String apiUrl = "http://localhost:8080/api/files/upload"; // Backend API URL

  var uri = Uri.parse(apiUrl);
  var request = http.MultipartRequest('POST', uri);

  // Get file details
  String? fileName = basename(file.path);
  var fileBytes = await file.readAsBytes();

  // Attach file to the request
  var multipartFile = http.MultipartFile.fromBytes(
   'file', // The form field name (it should match the backend's expected field name)
   fileBytes ,
   filename: fileName,
   contentType: MediaType('text', 'plain'), // Adjust content type as needed
  );

  request.files.add(multipartFile);

  // Send the request
  var response = await request.send();

  if (response.statusCode == 200) {
   var responseBody = await response.stream.bytesToString();
   print('File uploaded successfully. Response: $responseBody');

   // Assuming the response body contains the URL, you can extract it
   var data = jsonDecode(responseBody);
   String fileUrl = data['url']; // Assuming the server response includes the 'url' field
   print('File URL: $fileUrl');
  } else {
   print('Failed to upload file. Status code: ${response.statusCode}');
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
 Future<void> sendsolution() async {
  if (s1 == null) {
   s1 = solution(
    solution1: "akram zennad abdelmouaiz", // Replace with appropriate data
    ref_student: 35,
    ref_pw: 2,
    id_solution: 145,
    pdf: [], // Initialize with an empty list or existing file objects
    ref_feedback: null,
   );
  }

  // Add a file for demonstration (ensure `files` class is used correctly)



  // Convert the `solution` object to JSON
  final jsonBody = jsonEncode(s1?.toJson());
  print('Sending JSON: $jsonBody');

  // Send the HTTP POST request
  final url = Uri.parse('http://localhost:8080/api/solution/add');
  final response = await http.post(
   url,
   headers: {'Content-Type': 'application/json'},
   body: jsonBody,
  );

  if (response.statusCode == 200) {
   print('Success');
  } else {
   print('Failed: ${response.statusCode}');
   print('Response Body: ${response.body}');
  }
 }

 Future<void> Fetchfeedback(int pwid, int iduser) async {
  print('Fetching feedback for pwid: $pwid, iduser: $iduser');

  final url = Uri.parse(
      'http://localhost:8080/api/feedback/get-by-pw-user/$pwid/$iduser'); // Replace with your IP

  print('Constructed URL: $url');

  try {
   final response = await http.get(url, headers: {
    'Accept': 'application/json',
   });

   print('HTTP Status: ${response.statusCode}');
   print('Response Body: ${response.body}');

   if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Decoded Data: $data');
    feedback = Feedbacka.fromJson(data);
    isloading = true;
   } else {
    print('Failed to fetch feedback: ${response.statusCode}');
    isloading = false;
   }
  } catch (e) {
   print('Error occurred: $e');
   isloading = false;
  } finally {
   notifyListeners();
  }
 }

}