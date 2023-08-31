import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gpa_calculator/model/cgpas.dart';
// import 'package:gpa_calculator/model/gpa.dart';
import 'package:gpa_calculator/providers/user_cgpas.dart';
import 'package:gpa_calculator/screens/add_cgpa.dart';
import 'package:gpa_calculator/widgets/cgpa_card.dart';
import 'package:gpa_calculator/widgets/main_drawer.dart';
import 'package:gpa_calculator/widgets/main_stack.dart';
import 'package:gpa_calculator/widgets/style_button.dart';
import 'package:gpa_calculator/widgets/style_text.dart';
// import 'package:gpa_calculator/data/cgpa_data.dart';

class CgpaScreen extends ConsumerStatefulWidget {
  const CgpaScreen({super.key});

  @override
  ConsumerState<CgpaScreen> createState() => _CgpaScreenState();
}

class _CgpaScreenState extends ConsumerState<CgpaScreen> {
  int _getNoOfCourses(cgpaIndex) {
    int noOfCourse =
        ref.read(userCgpaProvider.notifier).getNoOfCourses(cgpaIndex);

    return noOfCourse;
  }

  int _getData(cgpaIndex, data) {
    int value = ref.read(userCgpaProvider.notifier).getData(cgpaIndex, data);
    return value;
  }

  int _getNoOfSessions(cgpaIndex) {
    int noOfSessions =
        ref.read(userCgpaProvider.notifier).getNoOfSessions(cgpaIndex);
    return noOfSessions;
  }

  void _addCgpa() {
    ref.read(userCgpaProvider.notifier).addCgpa();
    final int addedCgpaIndex = ref.read(userCgpaProvider).length - 1;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddCgpaScreen(currentCgpaIndex: addedCgpaIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cgpaList = ref.watch(userCgpaProvider);
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 55, 55, 59),
        title: const StyleText(
          text: 'Your CGPA',
          fontWeight: FontWeight.w400,
          fontSize: 21,
        ),
        centerTitle: true,
      ),
      body: MainStack(contents: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: cgpaList.length,
              itemBuilder: (context, index) => CgpaCard(
                cgpaIndex: index,
                cgpaName: cgpaList[index].name,
                noOfSessions: _getNoOfSessions(index),
                totalPoint: _getData(index, 'point'),
                totalUnit: _getData(index, 'unit'),
                noOfCourses: _getNoOfCourses(index),
                onDeleteCgpa: (int cIndex) {
                  setState(() {
                    cgpaList.removeAt(index);
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 21,
          right: 21,
          child: StyleButton(
            isEnable: true,
            isAdd: true,
            radius: 15,
            buttonType: 'add',
            onPressed: _addCgpa,
            child: const Icon(Icons.add),
          ),
        ),
      ]),
    );
  }
}
