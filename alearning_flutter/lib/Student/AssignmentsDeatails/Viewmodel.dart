
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
 List<PlatformFile>? pickedFiles =[];
  TextEditingController t1=TextEditingController();
   solution? s1=solution(solution1: 'solution1', ref_student: 8, ref_pw: 8, id_solution: 1, pdf: []);
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
 Future<List<PlatformFile>?> pickfile() async {
  try {
   final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'doc'],
   );

   if (result != null && result.files.isNotEmpty) {
    List<PlatformFile> selectedFiles = [];

    if (kIsWeb) {
     // Web-specific handling (using bytes)
     selectedFiles = result.files
         .where((file) => file.bytes != null) // Ensure file has byte data
         .toList();

     print('Selected files for web: ${selectedFiles.map((f) => f.name).toList()}');
    } else {
     // Mobile-specific handling (using paths)
     selectedFiles = result.files
         .where((file) => file.path != null) // Ensure file has a valid path
         .toList();

     print('Selected files for mobile: ${selectedFiles.map((f) => f.name).toList()}');
    }

    // Now, if you need to map the selected files to `files` objects
    s1?.pdf = selectedFiles.map((platformFile) {
     if (kIsWeb) {
      // For web, we can't create a File from path, but we can handle bytes
      return files(
       name: platformFile.name,
       url: '', // You can add the URL after uploading
       file: null, // No File object for web, as we handle bytes
       idfile: 2,
      );
     } else {
      // For mobile, create a File object using the path
      return files(
       name: platformFile.name,
       url: '', // You can add the URL after uploading
       file: File(platformFile.path!), // Mobile uses path to create a File
       idfile: 2,
      );
     }
    }).toList();

    notifyListeners(); // Notify listeners if you're using ChangeNotifier
    return selectedFiles; // Return the PlatformFile list
   } else {
    print('No files selected');
    return null; // No files selected, return null
   }
  } catch (e) {
   print('Error picking files: $e');
   return null; // Return null in case of error
  }
 }

 Future<String> uploadFileToBackendWeb(PlatformFile file) async {
  String apiUrl = "http://localhost:8080/api/files/upload"; // Backend API URL

  // On web, use the byte data available in the `file.bytes`
  if (file.bytes != null) {
   var fileBytes = file.bytes!;

   var uri = Uri.parse(apiUrl);
   var request = http.MultipartRequest('POST', uri);

   var multipartFile = http.MultipartFile.fromBytes(
    'file', // The form field name (it should match the backend's expected field name)
    fileBytes,
    filename: file.name,
    contentType: MediaType('application', 'octet-stream'), // Use a generic content type for files
   );

   request.files.add(multipartFile);

   var response = await request.send();

   if (response.statusCode == 200) {
    var responseBody = await response.stream.bytesToString();
    print('File uploaded successfully. Response: $responseBody');
    return responseBody;
   } else {

    print('Failed to upload file. Status code: ${response.statusCode}');
    return '';
   }
  }
  return '';
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