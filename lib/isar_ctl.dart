import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_life_calculator/model/isar_model.dart';

class IsarCtl {
  static Isar? isar;
  static RxString curTab = "계산기".obs;

  static init() async {
    var dir = await getApplicationSupportDirectory();
    isar = await Isar.open([SettingIsarSchema], directory: dir.path);

    var setting = await isar!.settingIsars.where().findFirst();
    if (setting == null) {
      await isar!.writeTxn(() async {
        await isar!.settingIsars.put(SettingIsar());
      });
      setting = await isar!.settingIsars.where().findFirst();
    }
    print(setting?.regPages);
  }
}
