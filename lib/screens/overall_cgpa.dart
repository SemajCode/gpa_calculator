import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/cgpa_container.dart';
import 'package:gpa_calculator/widgets/main_drawer.dart';
import 'package:gpa_calculator/widgets/main_stack.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class OverallCgpa extends StatefulWidget {
  const OverallCgpa({super.key});

  @override
  State<OverallCgpa> createState() => _OverallCgpaState();
}

class _OverallCgpaState extends State<OverallCgpa> {
  double cgpa = 0;
  String gradeClass = '';
  final unitList = <double>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  final pointList = <double>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  double getPoint(double pointValues, int index) {
    final values = pointValues;
    pointList[index] = values;
    return values;
  }

  double getUnit(double unitValues, int index) {
    final values = unitValues;
    unitList[index] = values;
    return values;
  }

  void calculate() {
    double totalPoint = 0;
    double totalUnit = 0;
    for (var point in pointList) {
      totalPoint += point;
    }
    for (var unit in unitList) {
      totalUnit += unit;
    }
    if (cgpa >= 4.5) {
      gradeClass = 'First Class';
    } else if (cgpa >= 3.5) {
      gradeClass = 'Second Class Upper';
    } else if (cgpa >= 2.5) {
      gradeClass = 'Second Class Lower';
    } else if (cgpa >= 1.5) {
      gradeClass = 'Third Class';
    } else if (cgpa >= 1.0) {
      gradeClass = 'Pass';
    } else {
      gradeClass = 'Fail';
    }
    setState(() {
      cgpa = totalPoint / totalUnit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 55, 59),
      bottomNavigationBar: SizedBox(
        height: 45,
        child: StyleButton(
          radius: 0,
          isAdd: false,
          buttonType: 'main',
          onPressed: calculate,
          isEnable: true,
          child: const StyleText(
            text: 'Calculate',
            fontSize: 20,
          ),
        ),
      ),
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 55, 55, 59),
        title: const StyleText(
          text: 'CGPA',
          fontWeight: FontWeight.w400,
          fontSize: 21,
        ),
        centerTitle: true,
      ),
      body: MainStack(
        contents: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StyleText(
                        text: cgpa.toStringAsFixed(2),
                        fontSize: 26,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      StyleText(
                        text: gradeClass,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: const Color.fromARGB(127, 0, 0, 0),
                          width: 2,
                        )),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => CgpaContainer(
                        index: index,
                        session: 'Session ${index + 1}',
                        getUnits: getUnit,
                        getPoints: getPoint,
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
