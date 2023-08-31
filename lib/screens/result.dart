import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpa_calculator/providers/user_cgpas.dart';
import 'package:gpa_calculator/widgets/cgpa_indicator.dart';
import 'package:gpa_calculator/widgets/main_stack.dart';
import 'package:gpa_calculator/widgets/result_list.dart';
import 'package:gpa_calculator/widgets/save_course_modal.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';
// import 'package:gpa_calculator/data/cgpa_data.dart';

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key, required this.cgpaIndex});

  final int cgpaIndex;

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  late final int cgpaIndex = widget.cgpaIndex;

  num _getData(cgpaIndex, data) {
    int value = ref.read(userCgpaProvider.notifier).getData(cgpaIndex, data);
    return value;
  }

  var currentGpaIndex = 0;

  void nextGpa() {
    final cgpaList = ref.read(userCgpaProvider);
    if (cgpaList[cgpaIndex].gpa.length > currentGpaIndex + 1) {
      setState(() {
        currentGpaIndex++;
      });
      return;
    }
  }

  void previousGpa() {
    setState(() {
      currentGpaIndex--;
    });
  }

  String _getSession() {
    String semester;
    String session;
    String value;
    switch (currentGpaIndex) {
      case 0:
        semester = 'First Semester';
        session = 'Session 1';
        break;

      case 1:
        semester = 'Second Semester';
        session = 'Session 1';
        break;

      case 2:
        semester = 'First Semester';
        session = 'Session 2';
        break;

      case 3:
        semester = 'Second Semester';
        session = 'Session 2';
        break;

      case 4:
        semester = 'First Semester';
        session = 'Session 3';
        break;

      case 5:
        semester = 'Second Semester';
        session = 'Session 3';
        break;

      case 6:
        semester = 'First Semester';
        session = 'Session 4';
        break;

      case 7:
        semester = 'Second Semester';
        session = 'Session 4';
        break;

      case 8:
        semester = 'First Semester';
        session = 'Session 5';
        break;

      case 9:
        semester = 'Second Semester';
        session = 'Session 5';
        break;

      case 10:
        semester = 'First Semester';
        session = 'Session 6';
        break;

      case 11:
        semester = 'Second Semester';
        session = 'Session 6';
        break;

      case 12:
        semester = 'First Semester';
        session = 'Session 7';
        break;

      case 13:
        semester = 'Second Semester';
        session = 'Session 7';
        break;
      default:
        semester = '';
        session = 'Extras';
        break;
    }
    value = '$session $semester';
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final cgpaList = ref.read(userCgpaProvider);
    final num totalPoint = _getData(cgpaIndex, 'point');
    final num totalunit = _getData(cgpaIndex, 'unit');
    final double cgpa = totalPoint / totalunit;
    String message = '';
    String gradeClass = '';
    if (cgpa >= 4.5) {
      gradeClass = 'First Class';
      message = 'Excellent!';
    } else if (cgpa >= 3.5) {
      gradeClass = 'Second Class Upper';
      message = 'Very Good!';
    } else if (cgpa >= 2.5) {
      gradeClass = 'Second Class Lower';
      message = 'Good!';
    } else if (cgpa >= 1.5) {
      gradeClass = 'Third Class';
      message = 'Satisfactory!';
    } else if (cgpa >= 1.0) {
      gradeClass = 'Pass';
      message = 'Poor Grade!';
    } else {
      gradeClass = 'Fail';
      message = 'Advice to withdraw!';
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 55, 55, 59),
        title: const StyleText(
          text: 'Results',
          fontWeight: FontWeight.w400,
          fontSize: 21,
        ),
        centerTitle: true,
      ),
      body: MainStack(
        contents: [
          Column(
            children: [
              SizedBox(
                height: 159,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyleText(
                          text: '$totalunit Units',
                          fontSize: 14,
                        ),
                        const SizedBox(width: 30),
                        CgpaIndicator(cgpa: cgpa),
                        const SizedBox(width: 30),
                        StyleText(
                          text: '$totalPoint Points',
                          fontSize: 14,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    StyleText(
                      text: gradeClass,
                      fontSize: 20,
                    ),
                    const SizedBox(height: 14),
                    StyleText(
                      text: message,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color.fromARGB(127, 0, 0, 0),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                  child: ResultList(
                    session: _getSession(),
                    currentGpaIndex: currentGpaIndex,
                    cgpaIndex: widget.cgpaIndex,
                    gpaList: cgpaList[widget.cgpaIndex].gpa,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: StyleButton(
                        isEnable: currentGpaIndex != 0,
                        buttonType: 'main',
                        onPressed: previousGpa,
                        isAdd: false,
                        radius: 54,
                        child: Image.asset(
                          'asset/icons/icons8-back-page-96.png',
                          width: 22.5,
                          height: 22.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: StyleButton(
                        isEnable: true,
                        buttonType: 'main',
                        isAdd: false,
                        radius: 54,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => SaveCourseModal(
                              cgpaIndex: cgpaIndex,
                              cgpaList: cgpaList,
                            ),
                          );
                        },
                        child: const StyleText(
                          text: 'SAVE',
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: StyleButton(
                        isEnable: cgpaList[cgpaIndex].gpa.length !=
                            currentGpaIndex + 1,
                        buttonType: 'main',
                        onPressed: nextGpa,
                        isAdd: false,
                        radius: 54,
                        child: Image.asset(
                          'asset/icons/icons8-next-page-96.png',
                          width: 22.5,
                          height: 22.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
