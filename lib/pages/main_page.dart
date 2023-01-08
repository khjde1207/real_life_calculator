import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/isar_ctl.dart';
import 'package:real_life_calculator/pages/age_clc_page.dart';
import 'package:real_life_calculator/pages/clc_page.dart';
import 'package:real_life_calculator/pages/exchange_rate_page.dart';
import 'package:real_life_calculator/pages/interest_clc_page.dart';
import 'package:real_life_calculator/pages/percent_page.dart';
import 'package:real_life_calculator/pages/stock_clc_page.dart';
import 'package:real_life_calculator/pages/time_clc_page.dart';
import 'package:real_life_calculator/pages/wage_clc_page.dart';
import 'package:styled_widget/styled_widget.dart';

class MainPage extends GetView {
  Map<String, GetView> pages = {
    "Calculator".tr: ClcPage(),
    "percentage calculator".tr: PercentPage(),
    "currency converter".tr: ExchangeRatePage(),
    "stock water ride".tr: StockClcPage(),
    "wage calculator".tr: WageClcPage(),
    "unit calculator".tr: InterestClcPage(),
    "time calculator".tr: TimeClcPage(),
    "age calculator".tr: AgeClcPage()
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: PreferredSize(
            child: Text("광고"), preferredSize: Size(Get.width, 50)),
      ),
      body: [
        [
          Icon(Icons.keyboard_double_arrow_left).opacity(0.5),
          pages
              .map((key, value) {
                return MapEntry(key, Obx(() {
                  return ElevatedButton(
                          onPressed: () {
                            IsarCtl.curTab(key);
                          },
                          child: Text(key))
                      .marginSymmetric(horizontal: 10)
                      .opacity(key == IsarCtl.curTab.value ? 1 : 0.5);
                }));
              })
              .values
              .toList()
              .toRow()
              .scrollable(scrollDirection: Axis.horizontal)
              .marginOnly(top: 15, bottom: 10)
              .expanded(),
          Icon(Icons.keyboard_double_arrow_right).opacity(0.5),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ].toRow().marginSymmetric(horizontal: 5),
        // ss,
        Obx(() {
          return pages[IsarCtl.curTab]!.expanded();
        }),
        // .expanded(),
        // Text("sasafdsafdfdsaf").expanded(),
        // Text("sasafdsafdfdsaf").expanded(),
      ].toColumn(),
      // bottomNavigationBar: NavigationBar(destinations: [
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "계산기"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "퍼센트"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "환율"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "주식"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "임금"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "이자"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "날자"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "나이"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "시간"),
      //   NavigationDestination(icon: Icon(Icons.calculate), label: "설정"),
      // ]),
    );
  }
}
