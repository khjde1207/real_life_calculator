import 'package:isar/isar.dart';

part 'isar_model.g.dart';

@Collection()
class SettingIsar {
  int id = Isar.autoIncrement;

  List<int> regPages = [0, 1, 2, 3, 4, 5, 6, 7, 8];
}

// @Collection()
class NumberTypeIsar {
  // int id = Isar.autoIncrement;

  int type = 0;
  String value = "";
}

class MathExpr {
  String mainCategory = "";
  String math = "";
  List<String> inputList = [];
  List<String> inputHints = [];
  String cmd = "";
  String title = "";
}
