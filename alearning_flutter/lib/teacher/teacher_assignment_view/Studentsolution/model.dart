import 'dart:io';

class solution {
   String solution1;
   int ref_student;
   int ref_pw;
   int? ref_feedback;
   int id_solution;
   String? firstname;
   String? lastname;
   int? id;
   List<files> pdf;
   String? pwname;

  solution({
    required this.solution1,
    required this.ref_student,
    required this.ref_pw,
    required this.id_solution,
    required this.pdf,
    this.ref_feedback,
    this.id,
    this.firstname,
    this.lastname,
     this.pwname
  });

  factory solution.fromJson(Map<String, dynamic> json) {
    return solution(
      solution1: json['solution'],
      ref_student: json['ref_student']??0,
      id_solution: json['id_solution'],
      ref_feedback: json['ref_feedback']?? 0,
      ref_pw: json['ref_pw']?? 0,
      pdf: List<files>.from(
        json['files'].map((x) => files.fromJson(x)),
      ),
      id: json['studentId'],
      firstname: json['studentFirstName'],
      lastname: json['studentLastName'],
      pwname: json['pwName']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'solution': solution1,
      'ref_student': ref_student,
      'id_solution': id_solution,
      'ref_feedback': ref_feedback,
      'ref_pw': ref_pw,
      'files': pdf.map((file) => file.toJson()).toList()??[],
    };
  }
}

class files {
  int? id_pw;
  int idfile;
  int? id_solution;
   String name;
  String? Role;
   String url;
   File? file;
  int? idSolution;
  files({
    required this.idfile,
    required this.name,
    required this.url,
    this.file,
    this.Role,
    this.id_pw,
    this.id_solution,
    this.idSolution
  });

  factory files.fromJson(Map<String, dynamic> json) {
    return files(
      idfile: json['id_file'],
      name: json['filename'],
      url: json['url_file'],
      Role: json['role']?? '',
      id_pw: json['idPw']?? 0,
      id_solution: json['id_solution']?? 0,
      idSolution: json['idSolution']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'filename': name,
      'url_file': url,
      'idPw':id_pw,
      'id_solution':id_solution,
      'role':Role
    };
  }

}
