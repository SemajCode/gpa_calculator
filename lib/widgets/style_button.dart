import 'package:flutter/material.dart';

class StyleButton extends StatelessWidget {
  const StyleButton({
    required this.child,
    required this.radius,
    required this.isAdd,
    required this.buttonType,
    required this.onPressed,
    this.padding,
    required this.isEnable,
    super.key,
  });

  final double radius;
  final void Function() onPressed;
  final Widget child;
  final String? buttonType;
  final bool isAdd;
  final double? padding;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry border;
    if (buttonType == 'main') {
      border = BorderRadius.circular(radius);
    } else {
      border = BorderRadius.only(
        topRight: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          disabledBackgroundColor: const Color.fromARGB(255, 99, 98, 110),
          disabledForegroundColor: Colors.white,
          shape: isAdd
              ? const CircleBorder()
              : RoundedRectangleBorder(borderRadius: border),
          backgroundColor: const Color.fromARGB(255, 252, 184, 9),
          padding: isAdd ? const EdgeInsets.all(15) : const EdgeInsets.all(0)),
      onPressed: isEnable ? onPressed : null,
      child: child,
    );
  }
}
