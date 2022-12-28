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
    this.onlyNumber = false,
  });

  List<Map<Widget, String Function()>> getButtons() {
    return [
      if (!onlyNumber)
        {
          IconsData.plus_minus(): () => "+/-",
          const Icon(
            Icons.folder_open,
            size: 42,
            color: Colors.orange,
          ): () => "open",
          const Icon(
            Icons.more_horiz,
            color: Colors.orange,
            size: 38,
          ): () => "...",
          const Icon(
            Icons.backspace_outlined,
            color: Colors.orange,
            size: 38,
          ): () => "back",
        },
      if (!onlyNumber)
        {
          const Text("AC")
              .fontSize(38)
              .fontWeight(FontWeight.bold)
              .textColor(Colors.orange): () => "AC",
          const Text("(")
              .fontSize(42)
              .fontWeight(FontWeight.bold)
              .textColor(Colors.orange): () => "(",
          const Text(")")
              .fontSize(42)
              .fontWeight(FontWeight.bold)
              .textColor(Colors.orange): () => ")",
          IconsData.divide(): () => "÷",
        },
      {
        const Text("7")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "7",
        const Text("8")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "8",
        const Text("9")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "9",
        if (!onlyNumber) IconsData.cross(): () => "×",
      },
      {
        const Text("4")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "4",
        const Text("5")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "5",
        const Text("6")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "6",
        if (!onlyNumber) IconsData.minus(): () => "-",
      },
      {
        const Text("1")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "1",
        const Text("2")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "2",
        const Text("3")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "3",
        if (!onlyNumber) IconsData.plus(): () => "+",
      },
      {
        const Text("0")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "0",
        const Text("00")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => "00",
        const Text(".")
            .fontSize(42)
            .fontWeight(FontWeight.bold)
            .textColor(Colors.orange): () => ".",
        if (!onlyNumber)
          const Icon(
            Icons.save_outlined,
            size: 42,
          ): () => "save",
      },
    ];
  }

  // Map<String, Function> engineeringButton = {
  //   "Hyp": () {},
  //   "sin": () {},
  //   "cos": () {},
  //   "tan": () {},
  //   "log": () {},
  //   "ln": () {},
  //   "mod": () {},
  //   "1/x": () {},
  //   "x!": () {},
  //   "x^2": () {},
  //   "x^y": () {},
  //   "x^3": () {},
  //   "x-10^y": () {},
  // };

  Function(String) onPressed;
  bool onlyNumber = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(builder: ((context, constraint) {
      var buttons = getButtons();
      var cnt = onlyNumber ? 3 : 4;
      var buttonWidth = (Get.width / cnt) - (cnt * 2.2);
      var buttonheight = (Get.height / 2) / 6.5;

      return [
        ...buttons.map((e) {
          var idx = buttons.indexOf(e);
          var c = Colors.orange;
          return [
            [
              ...e
                  .map((key, value) {
                    return MapEntry(
                        key,
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(buttonWidth, buttonheight),
                            maximumSize: Size(buttonWidth, buttonheight),
                            padding: EdgeInsets.zero,
                            foregroundColor: c,
                            side: BorderSide(width: 1, color: c),
                          ),
                          onPressed: () {
                            if (GetPlatform.isMobile) {
                              try {
                                Vibration.vibrate(duration: 10);
                              } catch (e) {}
                            }
                            onPressed(value());
                          },
                          child: key,
                          // Text(key).fontSize(32).textColor(Colors.white),
                        ).marginSymmetric(horizontal: 3, vertical: 3));
                  })
                  .values
                  .toList(),
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
            if (idx == 0) SizedBox(height: 5),
          ].toColumn();
        }).toList()
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
          )
          .padding(horizontal: 5, bottom: 10);
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