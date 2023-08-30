import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/main_stack.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainStack(
        contents: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const StyleText(
                  text: 'CGPA CALCULATOR',
                  textAlign: TextAlign.center,
                  fontSize: 51.5,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 22,
                ),
                StyleButton(
                  isEnable: true,
                  buttonType: 'main',
                  isAdd: false,
                  onPressed: () {},
                  radius: 54,
                  child: const StyleText(
                    text: 'START',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
