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
  }
}

class MathComp extends GetView {
  MathComp({
    Key? key,
    required this.mathdata,
    this.bSelect = false,
    this.curSelect,
    this.onSelect,
  }) : super(key: key) {
    ctl = Get.put(MathCompCtl(mathdata: mathdata), tag: key.toString());
    if (curSelect != null && curSelect!.key == this.key) {
      bSelect = true;
    }
  }
  late MathCompCtl ctl;
  MathExpr mathdata;
  bool bSelect = false;
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
    ctl.clcStr(Utils.clcMath(mathdata, ctl.datas));

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
    // var ctl = Get.find<MathCompCtl>();
    var cmd = mathdata.cmd.split("").asMap();

    return [
      Text(mathdata.title),
      SizedBox(
        height: 5,
      ),
      // Text(mathdata.cmd),
      List.generate(cmd.length, (index) {
        var ch = cmd[index];
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
        return Text(ch ?? "");
      }).toList().toWrap(crossAxisAlignment: WrapCrossAlignment.center),
      Obx(() {
        if (ctl.clcStr.value != null) {
          return Text(ctl.clcStr.toString());
        }
        return Text("");
      }).alignment(Alignment.bottomRight),
    ]
        .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start)
        .padding(all: 5)
        .decorated(
            border:
                Border.all(color: bSelect ? Colors.white : Colors.transparent))
        .gestures(onTap: () {
      if (onSelect != null) {
        onSelect!(this);
      }
    }).padding(all: 5);
  }
}
