import 'package:flutter/material.dart';
import 'package:gpa_calculator/model/cgpas.dart';
import 'package:gpa_calculator/model/gpa.dart';
import 'package:gpa_calculator/screens/add_cgpa.dart';
import 'package:gpa_calculator/widgets/cgpa_card.dart';
import 'package:gpa_calculator/widgets/main_drawer.dart';
import 'package:gpa_calculator/widgets/main_stack.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';
import 'package:gpa_calculator/data/cgpa_data.dart';

class CgpaScreen extends StatefulWidget {
  const CgpaScreen({super.key});

  @override
  State<CgpaScreen> createState() => _CgpaScreenState();
}

class _CgpaScreenState extends State<CgpaScreen> {
  int _getNoOfCourses(cgpaIndex) {
    int noOfCourse = 0;
    final gpaList = dummyData[cgpaIndex].gpa;
    for (var element in gpaList) {
      noOfCourse += element.courses.length;
    }

    if (noOfCourse == 0) {
      dummyData.remove(dummyData[cgpaIndex]);
    }
    return noOfCourse;
  }

  int _getData(cgpaIndex, data) {
    int value = 0;
    final gpaList = dummyData[cgpaIndex].gpa;
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

  int _getNoOfSessions(cgpaIndex) {
    int noOfSessions = 0;
    final gpaListLength = dummyData[cgpaIndex].gpa.length;
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

  void _addCgpa() {
    dummyData.add(
      Cgpas(
        name: 'CGPA${dummyData.length + 1}',
        gpa: [
          Gpa(
            courses: [],
            semester: 'First semester',
            session: 'Session 1',
          ),
        ],
      ),
    );
    final int addedCgpaIndex = dummyData.length - 1;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddCgpaScreen(currentCgpaIndex: addedCgpaIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 55, 55, 59),
        title: const StyleText(
          text: 'Your CGPA',
          fontWeight: FontWeight.w400,
          fontSize: 21,
        ),
        centerTitle: true,
      ),
      body: MainStack(contents: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context, index) => CgpaCard(
                cgpaIndex: index,
                cgpaName: dummyData[index].name,
                noOfSessions: _getNoOfSessions(index),
                totalPoint: _getData(index, 'point'),
                totalUnit: _getData(index, 'unit'),
                noOfCourses: _getNoOfCourses(index),
                onDeleteCgpa: (int cIndex) {
                  setState(() {
                    dummyData.removeAt(index);
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 21,
          right: 21,
          child: StyleButton(
            isEnable: true,
            isAdd: true,
            radius: 15,
            buttonType: 'add',
            onPressed: _addCgpa,
            child: const Icon(Icons.add),
          ),
        ),
      ]),
    );
  }
}
