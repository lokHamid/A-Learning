import 'package:a_learning/teacher/teacher_assignment_view/teacher_feedback/model.dart';

class Techerfeedmv {
  late Feedbacka _feedback;
  void feedbacksave(String feed,double? grade){
    _feedback=Feedbacka(grade,feed);

  }
}