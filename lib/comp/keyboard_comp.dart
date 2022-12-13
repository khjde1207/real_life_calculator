import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vibration/vibration.dart';

class KeyboardComp extends GetView {
  KeyboardComp({
    required this.onPressed,
  });

  Map<String, Function()> clcButtons1 = {
    "AC": () => NumberTypeIsar()
      ..type = 1
      ..value = "AC",
    "%": () => NumberTypeIsar()
      ..type = 1
      ..value = "%",
    "( )": () => NumberTypeIsar()
      ..type = 1
      ..value = "()",
    "÷": () => NumberTypeIsar()
      ..type = 1
      ..value = "÷",
  };
  Map<String, Function()> clcButtons2 = {
    "7": () => NumberTypeIsar()
      ..type = 0
      ..value = "7",
    "8": () => NumberTypeIsar()
      ..type = 0
      ..value = "8",
    "9": () => NumberTypeIsar()
      ..type = 0
      ..value = "9",
    "×": () => NumberTypeIsar()
      ..type = 1
      ..value = "×",
  };
  Map<String, Function()> clcButtons3 = {
    "4": () => NumberTypeIsar()
      ..type = 0
      ..value = "4",
    "5": () => NumberTypeIsar()
      ..type = 0
      ..value = "5",
    "6": () => NumberTypeIsar()
      ..type = 0
      ..value = "6",
    "-": () => NumberTypeIsar()
      ..type = 1
      ..value = "-",
  };
  Map<String, Function()> clcButtons4 = {
    "1": () => NumberTypeIsar()
      ..type = 0
      ..value = "1",
    "2": () => NumberTypeIsar()
      ..type = 0
      ..value = "2",
    "3": () => NumberTypeIsar()
      ..type = 0
      ..value = "3",
    "+": () => NumberTypeIsar()
      ..type = 1
      ..value = "+",
  };
  Map<String, Function()> clcButtons5 = {
    "0": () => NumberTypeIsar()
      ..type = 0
      ..value = "0",
    "00": () => NumberTypeIsar()
      ..type = 0
      ..value = "00",
    ".": () => NumberTypeIsar()
      ..type = 0
      ..value = ".",
    "=": () => NumberTypeIsar()
      ..type = 1
      ..value = "=",
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

  Function(NumberTypeIsar) onPressed;

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