import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpa_calculator/model/cgpas.dart';
import 'package:gpa_calculator/model/course.dart';
import 'package:gpa_calculator/model/gpa.dart';

class UserCgpaNotifier extends StateNotifier<List<Cgpas>> {
  UserCgpaNotifier() : super(const []);

  void addCgpa(Cgpas cgpa) {
    final newCgpa = cgpa;
    state = [newCgpa, ...state];
  }

  int getNoOfCourses(cgpaIndex) {
    int noOfCourse = 0;
    final gpaList = state[cgpaIndex].gpa;
    for (var element in gpaList) {
      noOfCourse += element.courses.length;
    }

    if (noOfCourse == 0) {
      state.remove(state[cgpaIndex]);
    }
    return noOfCourse;
  }

  int getData(cgpaIndex, data) {
    int value = 0;
    final gpaList = state[cgpaIndex].gpa;
    for (var element in gpaList) {
      int coursesLength = element.courses.length;
      int i = 0;
      while (i < coursesLength) {
        if (data == 'point') {
          value += element.courses[i].point;
        } else {
          value += element.courses[i].unit;
        }
        ++i;
      }
    }
    return value;
  }

  int getNoOfSessions(cgpaIndex) {
    int noOfSessions = 0;
    final gpaListLength = state[cgpaIndex].gpa.length;
    for (var i = 0; i < gpaListLength; i++) {
      if (i <= 1) {
        noOfSessions = 1;
      } else if (i <= 3) {
        noOfSessions = 2;
      } else if (i <= 5) {
        noOfSessions = 3;
      } else if (i <= 7) {
        noOfSessions = 4;
      } else if (i <= 9) {
        noOfSessions = 5;
      } else if (i <= 11) {
        noOfSessions = 6;
      } else if (i <= 3) {
        noOfSessions = 7;
      } else {
        noOfSessions = 8;
      }
    }
    return noOfSessions;
  }

  void createGpa(cgpaIndex, semester, session) {
    state[cgpaIndex].gpa.add(
          Gpa(
            courses: [],
            semester: semester,
            session: session,
          ),
        );
  }

  void addCourse(cgpaIndex, currentGpaIndex, Course course) {
    state[cgpaIndex].gpa[currentGpaIndex].courses.add(course);
  }

  void removeCourse(Course course, cgpaIndex, currentGpaIndex) {
    state[cgpaIndex].gpa[currentGpaIndex].courses.remove(course);
  }

  void insertCourse(Course course, cgpaIndex, currentGpaIndex) {
    final courseIndex =
        state[cgpaIndex].gpa[currentGpaIndex].courses.indexOf(course);
    state[cgpaIndex].gpa[currentGpaIndex].courses.insert(courseIndex, course);
  }

  void editCourse(Course course, index, cgpaIndex, currentGpaIndex) {
    state[cgpaIndex].gpa[currentGpaIndex].courses[index] = course;
  }

  List<Cgpas> printState() {
    final list = state;
    return list;
  }
}

final userCgpaProvider = StateNotifierProvider<UserCgpaNotifier, List<Cgpas>>(
    (ref) => UserCgpaNotifier());
