class Feedbacka{
double? grade;
String message;
Feedbacka( {this.grade,required this.message});
factory Feedbacka.fromJson(Map<String,dynamic> json){
  return Feedbacka(message: json['message'],
  grade: json['grade']
  );

}
Map<String,dynamic> toJson(){
  return{
    'message':message,
    'grade':grade
  };
}
}
