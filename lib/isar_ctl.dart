import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_life_calculator/model/isar_model.dart';

class IsarCtl {
  static Isar? isar;

  init() async {
    var dir = await getApplicationSupportDirectory();
    isar = await Isar.open([SettingIsarSchema], directory: dir.path);

    var setting = await isar!.settingIsars.where().findFirst();
    if (setting == null) {
      await isar!.writeTxn(() async {
        await isar!.settingIsars
            .put(SettingIsar()..tabpages = [PageData.PAGE1, PageData.PAGE2]);
      });
      setting = await isar!.settingIsars.where().findFirst();
    }
    print(isar!.settingIsars.where().findAll());
  }
}
