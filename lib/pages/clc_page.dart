import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:real_life_calculator/provider/utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ClcPage extends GetView {
  List<NumberTypeIsar> clcList = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: [
        Text("숫자 필드").expanded(),
        ElevatedButton(
            onPressed: () {
              Utils.clc(clcList);
            },
            child: Text("Test")),
        KeyboardComp(
          onPressed: (v) {
            if (v.value == "AC") {
              clcList.clear();
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
            if (v.type == 1) {
              clcList.add(v);
            }
            // print(v);
            Utils.clc(clcList);
            // clcList.forEach((e) {
            //   print(e.value);
            // });
          },
        ),
      ].toColumn(),
    );
  }
}
