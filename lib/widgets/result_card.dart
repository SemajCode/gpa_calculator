import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.grade,
    required this.point,
    required this.unit,
    required this.courseCode,
  });
  final String courseCode;
  final String grade;
  final int point;
  final int unit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(127, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 90,
              child: StyleText(
                textAlign: TextAlign.center,
                text: courseCode,
                fontSize: 11.5,
              ),
            ),
            const SizedBox(width: 30),
            StyleText(
              text: grade,
              fontSize: 11.5,
            ),
            const SizedBox(width: 50),
            StyleText(
              text: unit.toString(),
              fontSize: 11.5,
            ),
            const SizedBox(width: 40),
            SizedBox(
              width: 20,
              child: StyleText(
                textAlign: TextAlign.center,
                text: point.toString(),
                fontSize: 11.5,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
