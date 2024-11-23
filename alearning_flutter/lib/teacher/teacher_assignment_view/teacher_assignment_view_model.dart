import '/flutter_flow/flutter_flow_util.dart';
import 'teacher_assignment_view_widget.dart' show TeacherAssignmentViewWidget;
import 'package:flutter/material.dart';

class TeacherAssignmentViewModel
    extends FlutterFlowModel<TeacherAssignmentViewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
