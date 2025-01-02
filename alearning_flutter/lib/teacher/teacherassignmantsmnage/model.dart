import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';

class assignment{
 int pwid;
 String pwname;
 String steps;
 String? objectives;
 String? materials;
 DateTime? submissiondeadline;

 List<files>? file;
 String? coursename;

 assignment({this.coursename,this.materials,required this.pwid,required this.pwname,required this.steps, this.submissiondeadline,this.objectives,this.file});
 factory assignment.fromJson(Map<String,dynamic> json){
   return assignment(pwid: json['pwId'], pwname: json['pwname'], steps:json['steps'],  submissiondeadline: json['submissiondeadline'] != null
       ? DateTime.parse(json['submissiondeadline'])
       : null,
    objectives: json['objectives'],

    materials: json['materials']
    ,
    file: List<files>.from(
   json['files'].map((x) => files.fromJson(x)),),
   );
 }
 Map<String, dynamic> toJson() {
  return {
   'pw_id': pwid,
   'pwname': pwname,
   'steps': steps,
   'objectives': objectives,
   'courseName':coursename,
   'materials':materials,
   'submissiondeadline': submissiondeadline?.toIso8601String(),
   'files': file?.map((file) => file.toJson()).toList(),

  };
 }

}
