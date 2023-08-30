import 'package:gpa_calculator/model/course.dart';

class Gpa {
  Gpa({
    required this.courses,
    required this.semester,
    required this.session,
  });

  final String semester;
  final String session;
  final List<Course> courses;
}
