// ignore_for_file: unused_import

import 'package:gpa_calculator/model/cgpas.dart';
import 'package:gpa_calculator/model/course.dart';
import 'package:gpa_calculator/model/gpa.dart';

List<Cgpas> dummyData = [
  Cgpas(
    name: 'My first',
    gpa: [
      Gpa(
        semester: 'First semester',
        session: 'Session 1',
        courses: [
          Course(courseCode: 'CHM 111', grade: Grade.B, point: 12, unit: 3),
          Course(courseCode: 'CHM 112', grade: Grade.C, point: 3, unit: 1),
          Course(courseCode: 'GRE 111', grade: Grade.A, point: 5, unit: 1),
          Course(courseCode: 'GST 111', grade: Grade.A, point: 10, unit: 2),
          Course(courseCode: 'GST 112', grade: Grade.C, point: 6, unit: 2),
          Course(courseCode: 'MTH 111', grade: Grade.A, point: 20, unit: 4),
          Course(courseCode: 'PHY 111', grade: Grade.A, point: 15, unit: 3),
          Course(courseCode: 'PHY 112', grade: Grade.B, point: 4, unit: 1),
        ],
      ),
    ],
  ),
];
