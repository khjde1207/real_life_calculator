import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:real_life_calculator/provider/utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ExchangeRatePageCtl extends GetxController {
  var allCountryCodes = Utils.getExchangeList();
  Rxn<ExchangeCode> curExchangeCode = Rxn<ExchangeCode>();
  Rxn<ExchangeCode> targetExchangeCode = Rxn<ExchangeCode>();
  RxList<ExchangeCode> allExList = RxList<ExchangeCode>();

  Rx<ExchangeCode> current = ExchangeCode().obs;

  @override
  void onInit() {
    super.onInit();
    ever(curExchangeCode, loadExcange);
    ever(targetExchangeCode, loadExcange);

    var curCountryCode = Get.deviceLocale?.countryCode ?? "US";
    var targetCountryCode = "US";
    if (curCountryCode == "US") {
      targetCountryCode = "KR";
    }
    allExList(Utils.getExchangeList());
    curExchangeCode(
        allExList.firstWhereOrNull((e) => e.countryCode == curCountryCode));
    targetExchangeCode(
        allExList.firstWhereOrNull((e) => e.countryCode == targetCountryCode));
  }

  loadExcange(v) {
    if (curExchangeCode.value != null && targetExchangeCode.value != null) {}
    print(curExchangeCode.value?.countryCode);
    print(targetExchangeCode.value?.countryCode);
  }
}

class ExchangeRatePage extends GetView {
  var ctl = Get.put(ExchangeRatePageCtl());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: [
        Obx(() {
          if (ctl.allExList.isEmpty ||
              ctl.curExchangeCode.value == null ||
              ctl.targetExchangeCode.value == null) return SizedBox();
          return [
            DropdownButton(
                value: ctl.curExchangeCode.value,
                items: ctl.allExList.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e.name));
                }).toList(),
                onChanged: (value) {
                  ctl.curExchangeCode(value);
                }),
            DropdownButton(
                value: ctl.targetExchangeCode.value,
                items: ctl.allExList.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e.name));
                }).toList(),
                onChanged: (value) {
                  ctl.targetExchangeCode(value);
                })
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
        }),
        Text("환율 계산기"),
        ElevatedButton(
            onPressed: () {
              print(Get.deviceLocale?.countryCode ?? "US");
              var list = Utils.getExchangeList();
              print(list);
            },
            child: Text("test"))
      ].toColumn(),
    );
  }
}
