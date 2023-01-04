import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:real_life_calculator/provider/utils.dart';
import 'package:styled_widget/styled_widget.dart';

class MathCompCtl extends GetxController {
  MathCompCtl({
    required this.mathdata,
  });
  RxString curSelectStr = "".obs;
  MathExpr mathdata;
  RxMap<String, String> datas = RxMap<String, String>();
  RxnString clcStr = RxnString();
  @override
  void onInit() {
    // TODO: implement onInit
    mathdata.inputList.forEach((e) {
      datas.addAll({e: ""});
    });
    if (mathdata.inputList.isNotEmpty) {
      curSelectStr(mathdata.inputList.first);
    }
  }
}

class MathComp extends GetView {
  MathComp({
    Key? key,
    required this.mathdata,
    this.bSelect = false,
    this.curSelect,
    this.onSelect,
    this.currency = "",
  }) : super(key: key) {
    ctl = Get.put(MathCompCtl(mathdata: mathdata), tag: key.toString());
    if (curSelect != null && curSelect!.key == this.key) {
      bSelect = true;
    }
  }
  late MathCompCtl ctl;
  MathExpr mathdata;
  bool bSelect = false;
  String currency = "";
  MathComp? curSelect;
  Function(MathComp)? onSelect;

  onInput(String s) {
    if (s == "back") {
      if (ctl.datas.keys.contains(ctl.curSelectStr.value) &&
          ctl.datas[ctl.curSelectStr.value]!.isNotEmpty) {
        var val = ctl.datas[ctl.curSelectStr.value]!;
        ctl.datas[ctl.curSelectStr.value] = val.substring(0, val.length - 1);
        ctl.datas.refresh();
      }
    } else {
      if (ctl.datas.keys.contains(ctl.curSelectStr.value)) {
        ctl.datas[ctl.curSelectStr.value] =
            ctl.datas[ctl.curSelectStr.value]! + s;
        ctl.datas.refresh();
      }
    }
    var clcdata = Utils.clcMath(mathdata, ctl.datas);
    if (currency.isNotEmpty) {
      try {
        clcdata = Utils.numberFormat(double.parse(clcdata ?? ""));
        print("::::::::::::::::::::$clcdata");
      } catch (e) {}
    }
    ctl.clcStr(clcdata);

    // print("::::: $clcStr");
  }

  Widget EditTextBox({
    String value = "",
    bSelect = false,
    Function? onSelect,
  }) {
    return Text(value)
        .textAlignment(TextAlign.center)
        .padding(all: 10)
        .constrained(minWidth: 50)
        .decorated(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: bSelect ? Colors.white : Colors.white.withOpacity(0.3),
            ))
        .padding(horizontal: 5)
        .gestures(onTap: () {
      if (onSelect != null) {
        onSelect();
      }
    });
  }

  // RxInt curSelectIdx = (-1).obs;
  @override
  Widget build(BuildContext context) {
    var cmd = mathdata.cmd.split("");

    var rtn = [
      Text(mathdata.title),
      SizedBox(
        height: 5,
      ),
      // Text(mathdata.cmd),
      [
        cmd
            .map((ch) {
              if (mathdata.inputList.contains(ch)) {
                return Obx(
                  () {
                    return EditTextBox(
                        value: ctl.datas[ch] ?? "",
                        bSelect: ctl.curSelectStr.value == ch && bSelect,
                        onSelect: () {
                          if (!bSelect && onSelect != null) {
                            onSelect!(this);
                          }
                          ctl.curSelectStr(ch);
                        });
                  },
                );
              }
              return Text(ch);
            })
            .toList()
            .toWrap(crossAxisAlignment: WrapCrossAlignment.center),
        Obx(() {
          if (ctl.clcStr.value != null) {
            return Text("${ctl.clcStr.toString()}${mathdata.answer}")
                .fontWeight(FontWeight.bold)
                .fontSize(24);
          }
          return const Text("");
        }),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
      // List.generate(cmd.length, (index) {
      // }).toList().toWrap(crossAxisAlignment: WrapCrossAlignment.center),
    ]
        .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start)
        .padding(all: 10);

    // if (bSelect) {
    //   return rtn.card().gestures(onTap: () {
    //     if (onSelect != null) {
    //       onSelect!(this);
    //     }
    //   });
    // }
    return rtn
        .card(
          elevation: bSelect ? null : 0,
        )
        .opacity(bSelect ? 1 : 0.8)
        .gestures(onTap: () {
      if (onSelect != null) {
        onSelect!(this);
      }
    });
  }
}
