import 'package:flutter/material.dart';
// import 'package:gpa_calculator/data/cgpa_data.dart';
import 'package:gpa_calculator/screens/cgpa.dart';
import 'package:gpa_calculator/screens/overall_cgpa.dart';
import 'package:gpa_calculator/widgets/style_text.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: const Color.fromARGB(255, 55, 55, 59),
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(200, 252, 184, 9),
                  Color.fromARGB(255, 252, 184, 9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: StyleText(
                text: 'CGPA CALCULATOR',
                fontSize: 35,
                // textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: const StyleText(
              text: 'HOME',
              fontSize: 24,
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const CgpaScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calculate,
              color: Colors.white,
            ),
            title: const StyleText(
              text: 'CGPA',
              fontSize: 24,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const OverallCgpa(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
