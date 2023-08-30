import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/model/cgpas.dart';
import 'package:gpa_calculator/screens/cgpa.dart';
import 'package:gpa_calculator/widgets/main_stack.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class SaveCourseModal extends StatefulWidget {
  const SaveCourseModal({
    super.key,
    required this.cgpaIndex,
    required this.cgpaList,
  });

  final int cgpaIndex;
  final List<Cgpas> cgpaList;

  @override
  State<SaveCourseModal> createState() => _SaveCourseModalState();
}

class _SaveCourseModalState extends State<SaveCourseModal> {
  final _addCourseController = TextEditingController();

  void _saveCourseName() {
    if (_addCourseController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('You can\'t submit an empty course name!'),
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
    widget.cgpaList[widget.cgpaIndex].name = _addCourseController.text;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const CgpaScreen(),
    ));
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
                      text: 'Course name:',
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _addCourseController,
                      style: const TextStyle(color: Colors.white),
                      autocorrect: false,
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9 ]')),
                        LengthLimitingTextInputFormatter(12),
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
            const SizedBox(height: 10),
            StyleButton(
              radius: 18,
              isAdd: false,
              buttonType: 'main',
              onPressed: _saveCourseName,
              isEnable: true,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    ]);
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}
