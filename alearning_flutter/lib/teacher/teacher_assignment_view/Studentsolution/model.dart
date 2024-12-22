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
  final String name;
  final String url;
   File? file;
  files({
    required this.name,
    required this.url,
    this.file
  });

  factory files.fromJson(Map<String, dynamic> json) {
    return files(
      name: json['name'],
      url: json['url'],
      file: json['file'] != null ? File(json['file']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'file': file?.path,
    };
  }

}
