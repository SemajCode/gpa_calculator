import 'package:flutter/material.dart';
import 'package:gpa_calculator/model/gpa.dart';
import 'package:gpa_calculator/widgets/result_card.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class ResultList extends StatelessWidget {
  const ResultList({
    super.key,
    required this.cgpaIndex,
    required this.gpaList,
    required this.session,
    required this.currentGpaIndex,
  });

  final int cgpaIndex;
  final List<Gpa> gpaList;
  final String session;
  final int currentGpaIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StyleText(
          text: session,
          fontSize: 15,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 9),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyleText(
              text: 'Course code',
              fontSize: 11.5,
            ),
            SizedBox(width: 30),
            StyleText(
              text: 'Grade',
              fontSize: 11.5,
            ),
            SizedBox(width: 30),
            StyleText(
              text: 'Unit',
              fontSize: 11.5,
            ),
            SizedBox(width: 30),
            StyleText(
              text: 'Point',
              fontSize: 11.5,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: gpaList[currentGpaIndex].courses.length,
            itemBuilder: (context, index) => ResultCard(
                grade: gpaList[currentGpaIndex].courses[index].grade.name,
                point: gpaList[currentGpaIndex].courses[index].point,
                unit: gpaList[currentGpaIndex].courses[index].unit,
                courseCode: gpaList[currentGpaIndex].courses[index].courseCode),
          ),
        ),
      ],
    );
  }
}
