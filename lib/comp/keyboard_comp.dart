import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/icon_data.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vibration/vibration.dart';

class KeyboardComp extends GetView {
  KeyboardComp({
    required this.onPressed,
  });
  Map<Widget, Function()> clcButtons1 = {
    Text("AC")
        .fontSize(28)
        .fontWeight(FontWeight.bold)
        .textColor(Colors.orange): () => NumberTypeIsar()
      ..type = 1
      ..value = "AC",
    IconsData.per(): () => NumberTypeIsar()
      ..type = 1
      ..value = "%",
    IconsData.parenthesis(): () => NumberTypeIsar()
      ..type = 1
      ..value = "()",
    Icon(
      Icons.backspace_outlined,
      color: Colors.orange,
      size: 38,
    ): () => NumberTypeIsar()
      ..type = 1
      ..value = "÷",
  };
  Map<Widget, Function()> clcButtons2 = {
    Text("AC")
        .fontSize(28)
        .fontWeight(FontWeight.bold)
        .textColor(Colors.orange): () => NumberTypeIsar()
      ..type = 1
      ..value = "AC",
    IconsData.per(): () => NumberTypeIsar()
      ..type = 1
      ..value = "%",
    IconsData.parenthesis(): () => NumberTypeIsar()
      ..type = 1
      ..value = "()",
    IconsData.divide(): () => NumberTypeIsar()
      ..type = 1
      ..value = "÷",
  };
  Map<Widget, Function()> clcButtons3 = {
    Text("7").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "7",
    Text("8").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "8",
    Text("9").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "9",
    IconsData.cross(): () => NumberTypeIsar()
      ..type = 1
      ..value = "×",
  };
  Map<Widget, Function()> clcButtons4 = {
    Text("4").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "4",
    Text("5").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "5",
    Text("6").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "6",
    IconsData.minus(): () => NumberTypeIsar()
      ..type = 1
      ..value = "-",
  };
  Map<Widget, Function()> clcButtons5 = {
    Text("1").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "1",
    Text("2").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "2",
    Text("3").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "3",
    IconsData.plus(): () => NumberTypeIsar()
      ..type = 1
      ..value = "+",
  };
  Map<Widget, Function()> clcButtons6 = {
    Text("0").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = "0",
    Text("00")
        .fontSize(28)
        .fontWeight(FontWeight.bold)
        .textColor(Colors.orange): () => NumberTypeIsar()
      ..type = 0
      ..value = "00",
    Text(".").fontSize(28).fontWeight(FontWeight.bold).textColor(Colors.orange):
        () => NumberTypeIsar()
          ..type = 0
          ..value = ".",
    IconsData.eq(): () => NumberTypeIsar()
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
    return LayoutBuilder(builder: ((context, constraint) {
      var buttonWidth = (Get.width / 4) - (4 * 2.2);
      var buttonheight = (Get.height / 2) / 7;

      return [
        ...[
          clcButtons1,
          clcButtons2,
          clcButtons3,
          clcButtons4,
          clcButtons5,
          clcButtons6,
        ].map((e) {
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
                          if (GetPlatform.isMobile) {
                            Vibration.vibrate(duration: 10, amplitude: 200);
                          }
                          onPressed(value());
                        },
                        child: key,
                        // Text(key).fontSize(32).textColor(Colors.white),
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
    }));
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