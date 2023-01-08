import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:styled_widget/styled_widget.dart';

class StockClcPage extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: [
        [
          Text(
            "stock water ride".tr,
            style: Get.textTheme.headlineLarge,
          ),
        ].toColumn().paddingAll(10).expanded(),
        KeyboardComp(
          onlyNumber: true,
          onPressed: (v) {},
        )
      ].toColumn(),
    );
  }
}
