import 'package:isar/isar.dart';

part 'isar_model.g.dart';

@Collection()
class SettingIsar {
  int id = Isar.autoIncrement;
  List<PageData> tabpages = [];
}

enum PageData {
  PAGE1,
  PAGE2,
}
