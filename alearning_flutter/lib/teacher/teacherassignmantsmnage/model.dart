import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';

class assignment{
 String pwid;
 String pwname;
 String steps;
 String? objectives;
 String? materials;
 DateTime? submissiondeadline;
 int course_id;
 List<files>? file;
 List<files>? pw;
 assignment({required this.course_id,this.materials,required this.pwid,required this.pwname,required this.steps, this.submissiondeadline,this.objectives,this.file,this.pw});
 factory assignment.fromJson(Map<String,dynamic> json){
   return assignment(pwid: json['pw_id'], pwname: json['pwname'], steps:json['steps'],  submissiondeadline: DateTime.parse(json['submissiondeadline'])
   ,
    course_id: json['course_id']
    ,
    materials: json['materials']
    ,
    file: List<files>.from(
   json['files'].map((x) => files.fromJson(x)),),
    pw: List<files>.from(
     json['pw'].map((y) => files.fromJson(y)),)
   );
 }
 Map<String, dynamic> toJson() {
  return {
   'pw_id': pwid,
   'pwname': pwname,
   'steps': steps,
   'objectives': objectives,
   'course_id':course_id,
   'materials':materials,
   'submissiondeadline': submissiondeadline?.toIso8601String(),
   'files': file?.map((file) => file.toJson()).toList(),
   'pw': pw?.map((file) => file.toJson()).toList(),
  };
 }

}
