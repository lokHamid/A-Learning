class assignment{
 String pwid;
 String pwname;
 String steps;
 String? objectives;
 DateTime? submissiondeadline;
 assignment({required this.pwid,required this.pwname,required this.steps, this.submissiondeadline,this.objectives});
 factory assignment.fromJson(Map<String,dynamic> json){
   return assignment(pwid: json['pwid'], pwname: json['pwname'], steps:json['steps'], submissiondeadline:json['submissiondeadline']);
 }
 Map<String, dynamic> toJson() {
  return {
   'pwid': pwid,
   'pwname': pwname,
   'steps': steps,
   'objectives': objectives,
   'submissiondeadline': submissiondeadline?.toIso8601String(),  // Convert DateTime to ISO string
  };
 }

}
