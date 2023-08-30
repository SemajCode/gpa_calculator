import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/model/course.dart';
import 'package:gpa_calculator/widgets/main_stack.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class EditGpaModal extends StatefulWidget {
  const EditGpaModal({
    required this.courseIndex,
    required this.onEditCourse,
    required this.unit,
    required this.grade,
    required this.courseCode,
    super.key,
  });

  final void Function(Course course, int courseIndex) onEditCourse;
  final int courseIndex;
  final int unit;
  final Grade grade;
  final String courseCode;
  @override
  State<EditGpaModal> createState() => _EditGpaModalState();
}

class _EditGpaModalState extends State<EditGpaModal> {
  late final _courseCodeController =
      TextEditingController(text: widget.courseCode);
  late Grade _selectedGrade = widget.grade;
  late int _selectedUnit = widget.unit;
  int _calPoint = 0;

  void _submitCourseData() {
    if (_courseCodeController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('You can\'t submit an empty course code!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    switch (_selectedGrade) {
      case Grade.A:
        _calPoint = _selectedUnit * 5;
        break;

      case Grade.B:
        _calPoint = _selectedUnit * 4;
        break;

      case Grade.C:
        _calPoint = _selectedUnit * 3;
        break;

      case Grade.D:
        _calPoint = _selectedUnit * 2;
        break;

      case Grade.E:
        _calPoint = _selectedUnit * 1;
        break;

      case Grade.F:
        _calPoint = _selectedUnit * 0;
        break;
    }
    widget.onEditCourse(
      Course(
        courseCode: _courseCodeController.text,
        grade: _selectedGrade,
        point: _calPoint,
        unit: _selectedUnit,
      ),
      widget.courseIndex,
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _courseCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainStack(contents: [
      Container(
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color.fromARGB(127, 0, 0, 0),
        ),
        margin: const EdgeInsets.fromLTRB(20, 48, 20, 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  const SizedBox(
                    width: 108,
                    child: StyleText(
                      text: 'Course Code:',
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _courseCodeController,
                      style: const TextStyle(color: Colors.white),
                      autocorrect: false,
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9 ]')),
                        LengthLimitingTextInputFormatter(8),
                      ],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
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
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(
                  width: 108,
                  child: StyleText(
                    text: 'Grade:',
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(127, 0, 0, 0),
                    ),
                    child: DropdownButton(
                      value: _selectedGrade,
                      underline: const SizedBox.shrink(),
                      dropdownColor: const Color.fromARGB(180, 0, 0, 0),
                      padding: const EdgeInsets.only(left: 40),
                      alignment: Alignment.center,
                      items: Grade.values
                          .map((grade) => DropdownMenuItem(
                                value: grade,
                                child: Text(
                                  grade.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedGrade = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(
                  width: 108,
                  child: StyleText(
                    text: 'Units:',
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(127, 0, 0, 0),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox.shrink(),
                      padding: const EdgeInsets.only(left: 40),
                      dropdownColor: const Color.fromARGB(180, 0, 0, 0),
                      value: _selectedUnit,
                      items: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                          .map((unit) => DropdownMenuItem(
                                value: unit,
                                child: Text(
                                  unit.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedUnit = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                StyleButton(
                  radius: 18,
                  isAdd: false,
                  buttonType: 'main',
                  onPressed: _submitCourseData,
                  isEnable: true,
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      )
    ]);
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
