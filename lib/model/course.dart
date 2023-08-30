enum Grade { A, B, C, D, E, F }

class Course {
  Course({
    required this.courseCode,
    required this.grade,
    required this.point,
    required this.unit,
  });

  final String courseCode;
  final Grade grade;
  final int point;
  final int unit;
}
