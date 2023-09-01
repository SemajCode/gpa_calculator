import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpa_calculator/providers/user_cgpas.dart';
import 'package:gpa_calculator/model/course.dart';
// import 'package:gpa_calculator/model/gpa.dart';
import 'package:gpa_calculator/screens/result.dart';
import 'package:gpa_calculator/widgets/add_card.dart';
import 'package:gpa_calculator/widgets/add_gpa_modal.dart';
import 'package:gpa_calculator/widgets/edit_gpa_modal.dart';
import 'package:gpa_calculator/widgets/main_drawer.dart';
import 'package:gpa_calculator/widgets/main_stack.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';
// import 'package:gpa_calculator/data/cgpa_data.dart';

class AddCgpaScreen extends ConsumerStatefulWidget {
  const AddCgpaScreen({super.key, required this.currentCgpaIndex});

  final int currentCgpaIndex;

  @override
  ConsumerState<AddCgpaScreen> createState() => _AddCgpaScreenState();
}

class _AddCgpaScreenState extends ConsumerState<AddCgpaScreen> {
  late final cgpaIndex = widget.currentCgpaIndex;

  var currentGpaIndex = 0;
  String semester = '';
  String session = '';

  void nextGpa() {
    final cgpaList = ref.read(userCgpaProvider);
    switch (currentGpaIndex + 1) {
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
    }

    if (cgpaList[cgpaIndex].gpa.length > currentGpaIndex + 1) {
      setState(() {
        currentGpaIndex++;
      });
      return;
    } else {
      setState(() {
        ref.read(userCgpaProvider.notifier).createGpa(
              cgpaIndex,
              semester,
              session,
            );
        currentGpaIndex++;
      });
    }
  }

  void previousGpa() {
    setState(() {
      currentGpaIndex--;
    });
  }

  void _openAddCourseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddGpaModal(onAddCourse: _addCourse),
    );
  }

  void _addCourse(Course course) {
    ref.read(userCgpaProvider.notifier);
    setState(() {
      ref
          .read(userCgpaProvider.notifier)
          .addCourse(cgpaIndex, currentGpaIndex, course);
    });
  }

  void _openEditCourseOverlay(Course course, int index) {
    final courseCode = course.courseCode;
    final grade = course.grade;
    final unit = course.unit;
    final courseIndex = index;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => EditGpaModal(
        courseCode: courseCode,
        grade: grade,
        unit: unit,
        courseIndex: courseIndex,
        onEditCourse: _editCourse,
      ),
    );
  }

  void _editCourse(Course course, index) {
    setState(() {
      ref
          .read(userCgpaProvider.notifier)
          .editCourse(course, index, cgpaIndex, currentGpaIndex);
    });
  }

  void _removeCourse(Course course) {
    setState(() {
      ref
          .read(userCgpaProvider.notifier)
          .removeCourse(course, cgpaIndex, currentGpaIndex);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Course Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                ref
                    .read(userCgpaProvider.notifier)
                    .insertCourse(course, cgpaIndex, currentGpaIndex);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cgpaList = ref.read(userCgpaProvider);
    final currentGpa = cgpaList[cgpaIndex].gpa[currentGpaIndex];
    final currentCoursesList = currentGpa.courses;

    Widget content = const Center(
      child: StyleText(
        text: 'No course added yet.',
        fontSize: 20,
      ),
    );
    if (currentCoursesList.isNotEmpty) {
      content = ListView.builder(
        itemCount: currentCoursesList.length,
        itemBuilder: ((context, index) => Dismissible(
              background: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 5,
                ),
                child: Container(
                  color: Colors.red[400],
                  child: const Icon(Icons.delete),
                ),
              ),
              onDismissed: (direction) {
                _removeCourse(currentCoursesList[index]);
              },
              key: ValueKey(currentCoursesList[index]),
              child: AddCard(
                  courseCode: currentCoursesList[index].courseCode,
                  grade: currentCoursesList[index].grade.name,
                  point: currentCoursesList[index].point,
                  unit: currentCoursesList[index].unit,
                  courseIndex: index,
                  onTap: () {
                    _openEditCourseOverlay(currentCoursesList[index], index);
                  }),
            )),
      );
    }

    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 55, 55, 59),
        title: StyleText(
          text: '${currentGpa.session} - ${currentGpa.semester}',
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: MainStack(
        contents: [
          Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: const Color.fromARGB(127, 0, 0, 0),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(7),
                    child: content,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StyleButton(
                      isEnable: true,
                      buttonType: 'add',
                      radius: 12,
                      isAdd: true,
                      onPressed: _openAddCourseOverlay,
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(height: 12.5),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: StyleButton(
                              isEnable: currentGpaIndex > 0,
                              onPressed: previousGpa,
                              buttonType: 'main',
                              isAdd: false,
                              radius: 54,
                              child: Text(
                                'PREVIOUS',
                                style: GoogleFonts.roboto(fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: StyleButton(
                              isEnable: true,
                              onPressed: () {
                                num noOfCourse = 0;
                                final gpaList = cgpaList[cgpaIndex].gpa;
                                for (var element in gpaList) {
                                  noOfCourse += element.courses.length;
                                }
                                if (noOfCourse == 0) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Center(
                                          child: Text('Add a course first')),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                  return;
                                }
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                      cgpaIndex: cgpaIndex,
                                    ),
                                  ),
                                );
                              },
                              buttonType: 'main',
                              isAdd: false,
                              radius: 54,
                              child: Text(
                                'CALCULATE',
                                style: GoogleFonts.roboto(fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: StyleButton(
                              isEnable: currentCoursesList.isNotEmpty,
                              onPressed: nextGpa,
                              buttonType: 'main',
                              isAdd: false,
                              radius: 54,
                              child: Text(
                                'NEXT',
                                style: GoogleFonts.roboto(fontSize: 12),
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
          ),
        ],
      ),
    );
  }
}
