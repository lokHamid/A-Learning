import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:flutter/material.dart';
class teacherassignmanag extends ChangeNotifier{
final TextEditingController t1=TextEditingController();
final TextEditingController t2=TextEditingController();
final TextEditingController t3=TextEditingController();
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
  Future<void> sendAssignment(assignment assignment) async {// URL to send the POST request to
    final url = Uri.parse('https://your-api-endpoint.com/assignments');

    // Convert the assignment object to JSON
    final body = jsonEncode(assignment.toJson());

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