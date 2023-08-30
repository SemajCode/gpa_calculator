import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class CgpaIndicator extends StatelessWidget {
  const CgpaIndicator({
    super.key,
    required this.cgpa,
  });

  final double cgpa;

  @override
  Widget build(BuildContext context) {
    const double size = 73;
    const double twoPi = 3.14 * 2;
    double animationEndValue = (1 / 5.0) * cgpa;

    return Center(
        child: TweenAnimationBuilder(
      tween: Tween(
        begin: 0.0,
        end: animationEndValue,
      ),
      duration: const Duration(milliseconds: 750),
      builder: (context, value, child) {
        double cgpaValue = value * 5;
        return SizedBox(
          height: size,
          width: size,
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return SweepGradient(
                    stops: [value, value],
                    startAngle: 0,
                    endAngle: twoPi,
                    center: Alignment.center,
                    colors: const [
                      Color.fromARGB(255, 99, 98, 110),
                      Color.fromARGB(29, 99, 98, 110),
                    ],
                  ).createShader(rect);
                },
                child: Container(
                  height: size,
                  width: size,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 99, 98, 110),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size - 14.6,
                  height: size - 14.6,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 99, 98, 110),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: StyleText(
                      text: cgpaValue.toStringAsFixed(2),
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}

// Image.asset(
//   'asset/images/icons8-circle-100.png',
//   width: 73,
//   height: 73,
//   fit: BoxFit.cover,
// ),
// Positioned(
  // child: StyleText(
  //   text: cgpa.toStringAsFixed(2),
  //   fontSize: 23,
  //   fontWeight: FontWeight.w500,
  // ),
// ),
