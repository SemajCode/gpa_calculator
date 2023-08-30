import 'package:flutter/material.dart';
import 'package:gpa_calculator/screens/cgpa.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CGPA Calculator',
      home: CgpaScreen(),
    ),
  );
}
