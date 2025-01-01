
import '../../User.dart';

class Course{
  String coursename;
  String courseID;
  Level level;
  int coef;
  String teacher;
  int teacherID;
  Course({required this.coursename
    ,required this.courseID
    ,required this.coef,
    required this.level,
  required this.teacher,
    required this.teacherID
  });

  factory Course.fromJson(Map<String,dynamic> json){
    return Course(
        coursename:json['course_name'],
        coef:json['coefficient'],
        courseID:json['idCourse'],
        level: Level.values.firstWhere(
              (e) => e.toString() == 'Level.' + json['level'],
          orElse: () => Level.NONE, // Default to NONE if role is unknown
        ),
      teacher: json['teacher_name']??'',
      teacherID: json['teacherID']?? 0
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'course_name':coursename,
      'idCourse':courseID,
      'coefficient':coef,
      'level':level.toString().split('.').last,
      'teacher_name':teacher,
      'teacherID':teacherID

    };


  }
}