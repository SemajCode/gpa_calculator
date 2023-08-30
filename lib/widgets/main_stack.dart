import 'package:flutter/material.dart';

class MainStack extends StatelessWidget {
  const MainStack({
    required this.contents,
    super.key,
  });
  final List<Widget> contents;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'asset/images/image_bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: const Color.fromARGB(228, 99, 98, 110).withOpacity(0.7),
          width: double.infinity,
          height: double.infinity,
        ),
        ...contents
      ],
    );
  }
}
