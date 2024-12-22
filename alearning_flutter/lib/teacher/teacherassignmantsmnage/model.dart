import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';

class assignment{
 String pwid;
 String pwname;
 String steps;
 String? objectives;
 DateTime? submissiondeadline;
 List<files>? file;
 List<files>? pw;
 assignment({required this.pwid,required this.pwname,required this.steps, this.submissiondeadline,this.objectives,this.file,this.pw});
 factory assignment.fromJson(Map<String,dynamic> json){
   return assignment(pwid: json['pwid'], pwname: json['pwname'], steps:json['steps'], submissiondeadline:json['submissiondeadline']
   ,
    file: List<files>.from(
   json['file'].map((x) => files.fromJson(x)),),
    pw: List<files>.from(
     json['pw'].map((y) => files.fromJson(y)),)
   );
 }
 Map<String, dynamic> toJson() {
  return {
   'pwid': pwid,
   'pwname': pwname,
   'steps': steps,
   'objectives': objectives,
   'submissiondeadline': submissiondeadline?.toIso8601String(),
    // Convert DateTime to ISO string
  };
 }

}
