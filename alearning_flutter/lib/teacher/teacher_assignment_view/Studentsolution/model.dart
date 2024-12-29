import 'dart:io';

class solution {
   String solution1;
   int ref_student;
   int ref_pw;
   int? ref_feedback;
   int id_solution;
   List<files> pdf;

  solution({
    required this.solution1,
    required this.ref_student,
    required this.ref_pw,
    required this.id_solution,
    required this.pdf,
    this.ref_feedback,
  });

  factory solution.fromJson(Map<String, dynamic> json) {
    return solution(
      solution1: json['solution'],
      ref_student: json['ref_student'],
      id_solution: json['id_solution'],
      ref_feedback: json['ref_feedback'],
      ref_pw: json['ref_pw'],
      pdf: List<files>.from(
        json['files'].map((x) => files.fromJson(x)),
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'solution': solution1,
      'ref_student': ref_student,
      'id_solution': id_solution,
      'ref_feedback': ref_feedback,
      'ref_pw': ref_pw,
      'files': pdf.map((file) => file.toJson()).toList(),
    };
  }
}

class files {
  int? id_pw;
  int idfile;
  int? id_solution;
  final String name;
  String? Role;
  final String url;
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
      id_pw: json['idPw'],
      id_solution: json['id_solution'],
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
