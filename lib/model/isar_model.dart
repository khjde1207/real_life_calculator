import 'package:isar/isar.dart';

part 'isar_model.g.dart';

@Collection()
class SettingIsar {
  int id = Isar.autoIncrement;

  List<int> regPages = [0, 1, 2, 3, 4, 5, 6, 7, 8];
}
