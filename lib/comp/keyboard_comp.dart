import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vibration/vibration.dart';

class KeyboardComp extends GetView {
  KeyboardComp({
    required this.onPressed,
  });

  Map<String, Function()> clcButtons1 = {
    "C": () => "C",
    "%": () => "%",
    "( )": () => "()",
    "÷": () => "÷",
  };
  Map<String, Function()> clcButtons2 = {
    "7": () => "7",
    "8": () => "8",
    "9": () => "9",
    "×": () => "×",
  };
  Map<String, Function()> clcButtons3 = {
    "4": () => "4",
    "5": () => "5",
    "6": () => "6",
    "-": () => "-",
  };
  Map<String, Function()> clcButtons4 = {
    "1": () => "1",
    "2": () => "2",
    "3": () => "3",
    "+": () => "+",
  };
  Map<String, Function()> clcButtons5 = {
    "0": () => "0",
    "00": () => "00",
    ".": () => ".",
    "=": () => "=",
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

  Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var buttonWidth = (Get.width / 5) + 5;
    var buttonheight = (Get.height / 2) / 7;
    return [
      ...[clcButtons1, clcButtons2, clcButtons3, clcButtons4, clcButtons5]
          .map((e) {
        return [
          ...e
              .map((key, value) {
                return MapEntry(
                    key,
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(buttonWidth, buttonheight),
                        maximumSize: Size(buttonWidth, buttonheight),
                        padding: EdgeInsets.zero,
                        foregroundColor: Colors.white,
                        side: BorderSide(width: 1, color: Colors.orange),
                      ),
                      onPressed: () {
                        Vibration.vibrate(duration: 10, amplitude: 200);
                        onPressed(value());
                      },
                      child: Text(key).fontSize(32).textColor(Colors.white),
                    ).marginAll(5));
              })
              .values
              .toList(),
        ].toRow();
      }).toList()
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .padding(horizontal: 10, bottom: 10);
  }
}
// Text(key)
//     .fontSize(24)
//     .center()
//     .ripple(radius: buttonWidth / 6)
//     .gestures(onTap: () {})
//     .decorated(
//         border: Border.all(
//           width: 1,
//           color: Colors.orange,
//         ),
//         borderRadius: BorderRadius.circular(20))
//     .paddingAll(5) //
//     .width(buttonWidth)
//     .height(buttonheight),