import 'package:isar/isar.dart';

part 'isar_model.g.dart';

@Collection()
class SettingIsar {
  int id = Isar.autoIncrement;

  List<int> regPages = [0, 1, 2, 3, 4, 5, 6, 7, 8];
}

class MathExpr {
  String mainCategory = "";
  String subCategory = "";
  String math = "";
  List<String> inputList = [];
  List<String> inputHints = [];
  String cmd = "";
  String title = "";
  String answer = "";
}

// @Collection()
class NumberTypeIsar {
  // int id = Isar.autoIncrement;

  int type = 0;
  String value = "";
}

class ExchangeCode {
  String countryCode = "";
  String name = "";
  String code = "";
  String toCountryCode = "";
  String toName = "";
  String toCode = "";
  String basePrice = "";
  String fullcode = "";
  String currencyUnit = "";
  DateTime lastDate = DateTime.now();
}
