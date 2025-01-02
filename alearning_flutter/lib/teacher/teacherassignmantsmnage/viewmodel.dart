import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

import '../teacher_assignment_view/Studentsolution/model.dart';
import '../teachersassignments/viewmodel.dart';
class teacherassignmanag extends ChangeNotifier{
 TextEditingController t1=TextEditingController();
 TextEditingController t2=TextEditingController();
 TextEditingController t3=TextEditingController();
 TextEditingController t4=TextEditingController();
List<PlatformFile>? pickedFiles =[];
assignment? s1=assignment(pwid: 1, pwname: 'if', steps: '',file: []);
void updateField1(String value) {
  t1.text = value;
  notifyListeners();
}
void updateField2(String value) {
  t2.text = value;
  notifyListeners();
}
void updateField3(String value) {
  t3.text = value;
  notifyListeners();
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
      s1?.file = selectedFiles.map((platformFile) {
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
  Future<void> sendAssignment(assignment? assignments) async {


  // URL to send the POST request to
    final url = Uri.parse('http://localhost:8080/api/pw/add');

    // Convert the assignment object to JSON
    final body = jsonEncode(s1?.toJson());
    print(body);
    // Send POST request
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // If the server returns a success status code (200)
        print('Assignment sent successfully!');
      } else {
        // If the server returns an error status code
        print('Failed to send assignment. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any error
      print('Error sending request: $e');
    }
    notifyListeners();
  }
void addBulletPoint(TextEditingController controller) {
  final text = controller.text;
  final cursorPosition = controller.selection.baseOffset;

  // Ensure bullet point is only added after pressing Enter, not during deletion or other changes
  if (cursorPosition > 0 &&
      text[cursorPosition - 1] == '\n' && // Check if Enter was pressed
      !text.endsWith('\u2022 ') // Ensure bullet point isn't already there
  ) {
    final updatedText =
        text.substring(0, cursorPosition) + '\u2022 ' + text.substring(cursorPosition);
    controller.text = updatedText;

    // Move the cursor to the correct position after adding the bullet point
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: cursorPosition + 2), // Cursor after the "• "
    );
    notifyListeners();
  }
}

void handleTextChange(TextEditingController controller, String newValue) {
  // If the user deletes the bullet point, no bullet should be re-added
  final text = controller.text;
  final cursorPosition = controller.selection.baseOffset;

  if (text.endsWith('\n') && !text.contains('\u2022 ')) {
    addBulletPoint(controller);
  }

  // Allow normal text deletion, don't reinsert the bullet when deleting
  if (cursorPosition > 0 &&
      text[cursorPosition - 1] == '\n' &&
      text.substring(cursorPosition).startsWith('\u2022 ')) {
    // Handle case where bullet point should be removed if backspace is pressed
    controller.text = text.substring(0, cursorPosition - 2); // Remove bullet point
    controller.selection = TextSelection.fromPosition(TextPosition(offset: cursorPosition - 2));
  }

}
}