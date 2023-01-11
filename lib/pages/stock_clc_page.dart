import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:real_life_calculator/comp/math_comp.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:styled_widget/styled_widget.dart';

class StockClcPage extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<MathExpr> tests = [
      MathExpr()
        ..mainCategory = "stock"
        ..subCategory = "stock0"
        ..inputList = ["a", "b"]
        ..inputHints = ["보유 평단", "보유 수량"]
        ..math = "a*b"
        ..cmd = "a\t \tb"
        ..title = "현재 보유",
      MathExpr()
        ..mainCategory = "stock"
        ..subCategory = "stock1"
        ..inputList = ["a", "b"]
        ..inputHints = ["보유 평단", "보유 수량"]
        ..math = "a*b"
        ..cmd = "a\t \tb"
        ..title = "추가 매수",
      MathExpr()
        ..mainCategory = "percent"
        ..subCategory = "stocktotal"
        ..type = 1
        ..inputList = ["a", "b"]
        ..inputHints = ["최종 평단", "최종 금액"]
        ..math = "a*b"
        ..cmd = "ab\t \tb"
        ..title = "최종보유",
    ];

    Rxn<MathExpr> curselect = Rxn<MathExpr>();
    Rxn<MathComp> curselectComp = Rxn<MathComp>();

    return Scaffold(
      body: [
        Text(
          "stock water ride".tr,
          style: Get.textTheme.headlineLarge,
        ),
        [
          ...tests.map((e) {
            return Obx(
              () => MathComp(
                key: Key(e.title),
                mathdata: e,
                curSelect: curselectComp.value,
                onSelect: curselectComp,
              ),
            );
          }),
        ].toColumn().paddingAll(10).expanded(),
        KeyboardComp(
          onlyNumber: true,
          onPressed: (v) {},
        )
      ].toColumn(),
    );
  }
}
