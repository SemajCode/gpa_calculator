import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class AddCard extends StatelessWidget {
  const AddCard(
      {super.key,
      required this.courseIndex,
      required this.courseCode,
      required this.grade,
      required this.point,
      required this.unit,
      required this.onTap});

  final String courseCode;
  final String grade;
  final int point;
  final int unit;
  final int courseIndex;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(127, 0, 0, 0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(17.5),
            child: Row(
              children: [
                // Course code
                SizedBox(
                  width: 92,
                  child: StyleText(
                    text: courseCode,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 24),
                // Grade
                StyleText(
                  text: grade,
                  fontSize: 20,
                ),
                const SizedBox(width: 24),
                // Unit
                StyleText(
                  text: '$unit',
                  fontSize: 20,
                ),
                const SizedBox(width: 24),
                // Point
                SizedBox(
                  width: 30,
                  child: StyleText(
                    textAlign: TextAlign.center,
                    text: '$point',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: 35,
              child: StyleButton(
                isEnable: true,
                buttonType: null,
                isAdd: false,
                radius: 5,
                onPressed: onTap,
                child: const Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
