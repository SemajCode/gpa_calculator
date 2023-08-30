import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class CgpaContainer extends StatelessWidget {
  const CgpaContainer({
    super.key,
    required this.session,
    required this.getPoints,
    required this.getUnits,
    required this.index,
  });
  final int index;
  final String session;
  final double Function(double points, int index) getPoints;
  final double Function(double units, int index) getUnits;

  @override
  Widget build(BuildContext context) {
    double unit1 = 0;
    double unit2 = 0;
    double point1 = 0;
    double point2 = 0;
    double totalUnit;
    double totalPoint;

    void calTotal() {
      totalUnit = unit1 + unit2;
      totalPoint = point1 + point2;
      getPoints(totalPoint, index);
      getUnits(totalUnit, index);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: const Color.fromARGB(127, 0, 0, 0),
      ),
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          StyleText(
            text: session,
            fontSize: 16,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 90,
                child: StyleText(
                  text: 'Semester 1',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 85,
                height: 24,
                child: TextField(
                  onChanged: (value) {
                    if (value.trim().isEmpty) {
                      unit1 = 0;
                      calTotal();
                      return;
                    }
                    unit1 = double.tryParse(value)!;
                    calTotal();
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                    LengthLimitingTextInputFormatter(5),
                  ],
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Units',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(140, 255, 255, 255),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(127, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 85,
                height: 24,
                child: TextField(
                  onChanged: (value) {
                    if (value.trim().isEmpty) {
                      point1 = 0;
                      calTotal();
                      return;
                    }
                    point1 = double.tryParse(value)!;
                    calTotal();
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                    LengthLimitingTextInputFormatter(5),
                  ],
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Points',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(140, 255, 255, 255),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(127, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 90,
                child: StyleText(
                  text: 'Semester 2',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 85,
                height: 24,
                child: TextField(
                  onChanged: (value) {
                    if (value.trim().isEmpty) {
                      unit2 = 0;
                      calTotal();
                      return;
                    }
                    unit2 = double.tryParse(value)!;
                    calTotal();
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                    LengthLimitingTextInputFormatter(5),
                  ],
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Units',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(140, 255, 255, 255),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(127, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 85,
                height: 24,
                child: TextField(
                  onChanged: (value) {
                    if (value.trim().isEmpty) {
                      point2 = 0;
                      calTotal();
                      return;
                    }
                    point2 = double.tryParse(value)!;
                    calTotal();
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                    LengthLimitingTextInputFormatter(5),
                  ],
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Points',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(140, 255, 255, 255),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(127, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
