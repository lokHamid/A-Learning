class Feedbacka{
double? grade;
String message;
int? id_feedback;
Feedbacka( { this.id_feedback,this.grade,required this.message});
factory Feedbacka.fromJson(Map<String,dynamic> json){
  return Feedbacka(
      id_feedback: json['id_feedback'],
      message: json['comment'],
  grade: json['grade']
  );

}
Map<String,dynamic> toJson(){
  return{
      'id_feedback':id_feedback,
    'comment':message,
    'grade':grade
  };
}
}
