import 'package:gpa_calculator/model/gpa.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Cgpas {
  Cgpas({
    required this.name,
    required this.gpa,
  }) : id = uuid.v4();

  final String id;
  String name;
  final List<Gpa> gpa;
}
