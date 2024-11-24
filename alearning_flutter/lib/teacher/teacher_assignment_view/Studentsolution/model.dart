class solution {
  final String solution1;
  final String studentname;
  final int id;
  final List<files> pdf;

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
}

class files {
  final String name;
  final String url;

  files({
    required this.name,
    required this.url,
  });

  factory files.fromJson(Map<String, dynamic> json) {
    return files(
      name: json['name'],
      url: json['url'],
    );
  }
}
