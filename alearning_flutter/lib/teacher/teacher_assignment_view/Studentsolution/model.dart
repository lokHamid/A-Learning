import 'dart:io';

class solution {
   String solution1;
   String studentname;
   int id;
  List<files> pdf;

  solution({
    required this.solution1,
    required this.studentname,
    required this.id,
    required this.pdf,
  });

  factory solution.fromJson(Map<String, dynamic> json) {
    return solution(
      solution1: json['solution'],
      studentname: json['studentname'],
      id: json['id'],
      pdf: List<files>.from(
        json['pdf'].map((x) => files.fromJson(x)),
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'solution': solution1,
      'studentname': studentname,
      'id': id,
      'pdf': pdf.map((file) => file.toJson()).toList(),
    };
  }
}

class files {
  int? id_pw;
  int? id_solution;
  final String name;
  String? Role;
  final String url;
   File? file;
  files({
    required this.name,
    required this.url,
    this.file,
    this.Role,
    this.id_pw,
    this.id_solution
  });

  factory files.fromJson(Map<String, dynamic> json) {
    return files(
      name: json['name'],
      url: json['url'],
      Role: json['Role'],
      id_pw: json['id_pw'],
      id_solution: json['id_solution'],
      file: json['file'] != null ? File(json['file']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'file': file?.path,
      'id_pw':id_pw,
      'id_solution':id_solution,
      'Role':Role
    };
  }

}
