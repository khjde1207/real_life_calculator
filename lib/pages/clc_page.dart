import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/icon_data.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:real_life_calculator/provider/utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ClcPage extends GetView {
  RxList<NumberTypeIsar> clcList = RxList<NumberTypeIsar>();
  Rx<Decimal> rtnValue = Decimal.parse("0").obs;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: [
        Obx(() {
          if (clcList.isEmpty) {
            return SizedBox();
          }
          // print("LLLLLLLLLLLLLLLL$clcList");
          var t = clcList;
          // .getRange(
          //     (clcList.length - 30).clamp(0, clcList.length), clcList.length);
          return LayoutBuilder(builder: (p0, p1) {
            print(p1);
            return t
                .map((e) {
                  return AutoSizeText(
                    e.value,
                    maxFontSize: 32,
                    minFontSize: 24,
                    textAlign: TextAlign.end,
                  )
                      // .fontSize(e.type == 0 ? 32 : 24)
                      // .textColor(Colors.white.withOpacity(0.8))
                      .marginSymmetric(horizontal: 2);
                })
                .toList()
                .toWrap(
                  alignment: WrapAlignment.end,
                  runAlignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  clipBehavior: Clip.hardEdge,
                );
            // .overflow(maxHeight: p1.maxHeight);
          });
        }).width(double.infinity).marginSymmetric(horizontal: 20).expanded(),
        Divider(),
        Obx(() {
          return [
            AutoSizeText(
              rtnValue.toString(),
              maxFontSize: 42,
              minFontSize: 24,
              textAlign: TextAlign.right,
            ).marginOnly(right: 10).expanded(),
            IconsData.eq(color: Colors.white),
          ]
              .toRow(mainAxisAlignment: MainAxisAlignment.end)
              .marginSymmetric(horizontal: 10);
        }),
        Divider(),
        Obx(() {
          return [
            AutoSizeText(
              clcList.isNotEmpty && clcList.last.type == 0
                  ? clcList.last.value
                  : "",
              maxFontSize: 42,
              minFontSize: 24,
              textAlign: TextAlign.right,
            ).marginSymmetric(horizontal: 10).expanded(),
            IconButton(
              onPressed: () {
                if (clcList.isNotEmpty) {
                  if (clcList.last.type == 0 && clcList.last.value.isNotEmpty) {
                    clcList.last.value = clcList.last.value
                        .substring(0, clcList.last.value.length - 1);
                  }
                  if (clcList.last.type == 0 && clcList.last.value.isEmpty) {
                    clcList.removeLast();
                    if (clcList.isNotEmpty) {
                      clcList.removeLast();
                    }
                  } else {
                    clcList.removeLast();
                  }
                  clcList.refresh();
                  rtnValue(Utils.clc(clcList));
                }
              },
              icon: Icon(
                Icons.backspace,
                size: 42,
              ),
            ),
          ].toRow(mainAxisAlignment: MainAxisAlignment.end);
        }),
        Divider().marginOnly(bottom: 10),
        // Text("숫자 필드"),
        // ElevatedButton(
        //   onPressed: () {
        //     Utils.clc(clcList);
        //   },
        //   child: Text("Test"),
        // ),
        KeyboardComp(
          onPressed: (v) {
            if (v.value == "AC") {
              clcList.clear();
              rtnValue(Utils.clc(clcList));
              return;
            }

            if (v.type == 0) {
              if (clcList.isEmpty) {
                clcList.add(v);
              } else {
                if (clcList.last.type == 0) {
                  clcList.last.value += v.value;
                } else {
                  clcList.add(v);
                }
              }
            }
            if (clcList.isNotEmpty && clcList.last.type == 0 && v.type == 1) {
              var bClc = [
                "%",
                "()",
                "÷",
                "×",
                "-",
                "+",
              ].contains(v.value);
              if (bClc) {
                clcList.add(v);
              }
            }
            // print(v);
            clcList.refresh();
            rtnValue(Utils.clc(clcList));
            // clcList.forEach((e) {
            //   print(e.value);
            // });
          },
        ),
      ].toColumn(),
    );
  }
}
