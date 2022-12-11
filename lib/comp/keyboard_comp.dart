import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class KeyboardComp extends GetView {
  Map<String, Function()> clcButtons = {
    "%": () {},
    "C": () {},
    "( )": () {},
    // ")": () {},
  };

  Map<String, Function()> verticalClcButtons = {
    "÷": () {},
    "×": () {},
    "-": () {},
    "+": () {},
  };

  Map<String, Function> engineeringButton = {
    "Hyp": () {},
    "sin": () {},
    "cos": () {},
    "tan": () {},
    "log": () {},
    "ln": () {},
    "mod": () {},
    "1/x": () {},
    "x!": () {},
    "x^2": () {},
    "x^y": () {},
    "x^3": () {},
    "x-10^y": () {},
  };
  Map<String, Function> numberButtons = {
    "7": () {},
    "8": () {},
    "9": () {},
    "4": () {},
    "5": () {},
    "6": () {},
    "1": () {},
    "2": () {},
    "3": () {},
    "0": () {},
    "00": () {},
    ".": () {},
  };
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var buttonWidth = Get.width / 4;

    return [
      [
        ...clcButtons
            .map((key, value) {
              return MapEntry(
                key,
                Text(key)
                    .center()
                    .border(all: 1)
                    .borderRadius(all: 10)
                    .paddingAll(5) //
                    .width(buttonWidth),
              );
            })
            .values
            .toList(),
        [
          ...clcButtons
              .map((key, value) {
                return MapEntry(
                  key,
                  Text(key)
                      .center()
                      .border(all: 1)
                      .borderRadius(all: 10)
                      .paddingAll(5) //
                      .width(buttonWidth),
                );
              })
              .values
              .toList(),
        ].toColumn()
      ].toRow()
    ].toColumn(mainAxisAlignment: MainAxisAlignment.start);
  }
}
