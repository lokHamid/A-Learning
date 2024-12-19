
class Course{
  String coursename;
  String courseID;
  String level;
  int coef;
  String teacher;
  Course({required this.coursename
    ,required this.courseID
    ,required this.coef,
    required this.level,
  required this.teacher
  });
  factory Course.fromJson(Map<String,dynamic> json){
    return Course(
        coursename:json['coursename'],
        coef:json['coef'],
        courseID:json['courseID'],
        level: json['level'],
      teacher: json['teacher']
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'coursename':coursename,
      'courseID':courseID,
      'coef':coef,
      'level':level,
      'teacher':teacher
    };


  }
}