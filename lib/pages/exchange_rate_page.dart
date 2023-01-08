import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:real_life_calculator/comp/math_comp.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:real_life_calculator/provider/net.dart';
import 'package:real_life_calculator/provider/utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ExchangeRatePageCtl extends GetxController {
  var allCountryCodes = Utils.getExchangeList();
  Rxn<ExchangeCode> formExchangeCode = Rxn<ExchangeCode>();
  Rxn<ExchangeCode> toExchangeCode = Rxn<ExchangeCode>();
  RxList<ExchangeCode> formAllExList = RxList<ExchangeCode>();
  RxList<ExchangeCode> toAllExList = RxList<ExchangeCode>();

  Rx<ExchangeCode> currentExchangeCode = ExchangeCode().obs;
  RxList<MathExpr> exchangeMathList = RxList<MathExpr>();
  @override
  void onInit() {
    super.onInit();
    ever(formExchangeCode, loadExcange);
    ever(toExchangeCode, loadExcange);

    var curCountryCode = Get.deviceLocale?.countryCode ?? "KR";
    var targetCountryCode = "US";
    if (curCountryCode == "US") {
      curCountryCode = "KR";
    }
    var allList = Utils.getExchangeList();
    formAllExList(allList.toList()..removeWhere((e) => e.countryCode == "US"));
    toAllExList(allList.toList());

    formExchangeCode(
        formAllExList.firstWhereOrNull((e) => e.countryCode == curCountryCode));
    toExchangeCode(toAllExList
        .firstWhereOrNull((e) => e.countryCode == targetCountryCode));
  }

  loadExcange(v) async {
    if (formExchangeCode.value != null && toExchangeCode.value != null) {
      var rtn =
          await Net.getexchange(formExchangeCode.value!, toExchangeCode.value!);
      if (rtn == null) {
        Get.snackbar("환율 정보 로딩 실패", "해당 환율 정보는 지원 되지 않습니다.");
        return;
      }
      currentExchangeCode(rtn);
      exchangeMathList([
        MathExpr()
          ..mainCategory = "excahge"
          ..subCategory = "excahge1"
          ..inputList = ["a"]
          ..inputHints = ["a"]
          ..math = "a/${currentExchangeCode.value.basePrice}"
          ..cmd = "a${currentExchangeCode.value.code}"
          ..title =
              "${currentExchangeCode.value.name} -> ${currentExchangeCode.value.toName}"
          ..answer = "${currentExchangeCode.value.toCode}",
        MathExpr()
          ..mainCategory = "excahge"
          ..subCategory = "excahge1"
          ..inputList = ["a"]
          ..inputHints = ["a"]
          ..math = "${currentExchangeCode.value.basePrice}*a"
          ..cmd = "a${currentExchangeCode.value.toCode}"
          ..title =
              "${currentExchangeCode.value.toName} -> ${currentExchangeCode.value.name}"
          ..answer = "${currentExchangeCode.value.code}",
      ]);
    }
  }
}

class ExchangeRatePage extends GetView {
  var ctl = Get.put(ExchangeRatePageCtl());
  Rxn<MathExpr> curselect = Rxn<MathExpr>();
  Rxn<MathComp> curselectComp = Rxn<MathComp>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: [
        [
          Text(
            "currency converter".tr,
            style: Get.textTheme.headlineLarge,
          ),
          Obx(() {
            if (ctl.formAllExList.isEmpty ||
                ctl.toAllExList.isEmpty ||
                ctl.formExchangeCode.value == null ||
                ctl.toExchangeCode.value == null) return SizedBox();

            return [
              DropdownButton(
                  value: ctl.formExchangeCode.value,
                  items: ctl.formAllExList.map((e) {
                    return DropdownMenuItem(
                        value: e, child: Text("${e.name} ${e.code}"));
                  }).toList(),
                  onChanged: (value) {
                    ctl.formExchangeCode(value);
                  }),
              DropdownButton(
                  value: ctl.toExchangeCode.value,
                  items: ctl.toAllExList.map((e) {
                    return DropdownMenuItem(
                        value: e, child: Text("${e.name} ${e.code}"));
                  }).toList(),
                  onChanged: (value) {
                    ctl.toExchangeCode(value);
                  })
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
          }),
          SizedBox(height: 10),
          Obx(() {
            return [
              [
                Text("${ctl.currentExchangeCode.value.basePrice} ")
                    .fontSize(22),
                Text(ctl.currentExchangeCode.value.code),
              ].toRow(crossAxisAlignment: CrossAxisAlignment.center),
              [
                Text("${ctl.currentExchangeCode.value.currencyUnit} ")
                    .fontSize(22),
                Text(ctl.currentExchangeCode.value.toCode),
              ].toRow(crossAxisAlignment: CrossAxisAlignment.center),
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
          }),
          Obx(() {
            return ctl.exchangeMathList
                .map((e) {
                  return MathComp(
                    key: Key(
                        "${e.title}${ctl.currentExchangeCode.value.fullcode}"),
                    mathdata: e,
                    curSelect: curselectComp.value,
                    onSelect: curselectComp,
                    currency: ctl.currentExchangeCode.value.code,
                    // currency: e,
                  );
                })
                .toList()
                .toColumn();
          }),
          // SizedBox(height: 10),
          // Text("환율 계산기"),
          // ElevatedButton(
          //     onPressed: () {
          //       print(Get.deviceLocale?.countryCode ?? "US");
          //       var list = Utils.getExchangeList();
          //       print(list);
          //     },
          //     child: Text("test")),
          // ElevatedButton(
          //     onPressed: () async {
          //       ctl.exchangeMathList.clear();
          //       await 1.delay();
          //       ctl.exchangeMathList([
          //         MathExpr()
          //           ..mainCategory = "excahge"
          //           ..subCategory = "excahge1"
          //           ..inputList = ["a"]
          //           ..inputHints = ["a"]
          //           ..math = "a/${ctl.currentExchangeCode.value.basePrice}"
          //           ..cmd = "a${ctl.currentExchangeCode.value.code}"
          //           ..title =
          //               "${ctl.currentExchangeCode.value.name} -> ${ctl.currentExchangeCode.value.toName}"
          //           ..answer = "${ctl.currentExchangeCode.value.toCode}",
          //         MathExpr()
          //           ..mainCategory = "excahge"
          //           ..subCategory = "excahge1"
          //           ..inputList = ["a"]
          //           ..inputHints = ["a"]
          //           ..math = "${ctl.currentExchangeCode.value.basePrice}*a"
          //           ..cmd = "a${ctl.currentExchangeCode.value.toCode}"
          //           ..title =
          //               "${ctl.currentExchangeCode.value.toName} -> ${ctl.currentExchangeCode.value.name}"
          //           ..answer = "${ctl.currentExchangeCode.value.code}",
          //       ]);
          //     },
          //     child: Text("test"))
        ].toColumn().paddingAll(10).expanded(),
        KeyboardComp(
          onlyNumber: true,
          onPressed: (v) {
            if (curselectComp.value != null) {
              curselectComp.value!.onInput(v);
            }
          },
        )
      ].toColumn(),
    );
  }
}
