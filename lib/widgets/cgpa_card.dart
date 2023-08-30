import 'package:flutter/material.dart';
// import 'package:gpa_calculator/data/cgpa_data.dart';
import 'package:gpa_calculator/screens/add_cgpa.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class CgpaCard extends StatelessWidget {
  const CgpaCard({
    super.key,
    required this.cgpaName,
    required this.noOfSessions,
    required this.totalPoint,
    required this.totalUnit,
    required this.noOfCourses,
    required this.cgpaIndex,
    required this.onDeleteCgpa,
  });
  final void Function(int cIndex) onDeleteCgpa;
  final int cgpaIndex;
  final String cgpaName;
  final int noOfSessions;
  final int totalUnit;
  final int totalPoint;
  final int noOfCourses;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 55, 55, 59),
            title: const StyleText(text: 'Delete'),
            content: const StyleText(text: 'Do you want to delete this item?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                    color: Color.fromARGB(255, 252, 184, 9),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  onDeleteCgpa(cgpaIndex);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Color.fromARGB(255, 252, 184, 9),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddCgpaScreen(currentCgpaIndex: cgpaIndex),
          ),
        );
      },
      child: Card(
        elevation: 0,
        color: const Color.fromARGB(126, 20, 20, 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: StyleText(
                text: cgpaName,
                fontSize: 17.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyleText(
                  text: noOfCourses > 1
                      ? '$noOfCourses Courses'
                      : '$noOfCourses Course',
                  fontWeight: FontWeight.w300,
                  fontSize: 13.5,
                ),
                const SizedBox(width: 20),
                StyleText(
                  text: noOfSessions > 1
                      ? '$noOfSessions Sessions'
                      : '$noOfSessions Session',
                  fontWeight: FontWeight.w300,
                  fontSize: 13.5,
                ),
                const SizedBox(width: 20),
                StyleText(
                  text: totalUnit > 1 ? '$totalUnit units' : '$totalUnit unit',
                  fontWeight: FontWeight.w300,
                  fontSize: 13.5,
                ),
                const SizedBox(width: 20),
                StyleText(
                  text: totalPoint > 1
                      ? '$totalPoint Points'
                      : '$totalPoint Point',
                  fontSize: 13.5,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
