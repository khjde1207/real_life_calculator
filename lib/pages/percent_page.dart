import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:real_life_calculator/comp/math_comp.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:styled_widget/styled_widget.dart';

class PercentPageCtl extends GetxController {
  int curSelectBox = 0;
}

class PercentPage extends GetView {
  List<MathExpr> tests = [
    MathExpr()
      ..mainCategory = "percent"
      ..subCategory = "percent1"
      ..inputList = ["a", "b"]
      ..inputHints = ["a", "b"]
      ..math = "a*b/100"
      ..cmd = "a의b%는 얼마?"
      ..title = "전체값의 몇프로는 는 얼마",
    MathExpr()
      ..mainCategory = "percent"
      ..subCategory = "percent2"
      ..inputList = ["a", "b"]
      ..inputHints = ["a", "b"]
      ..math = "b*100/a"
      ..cmd = "a에서b는 몇프로?"
      ..title = "전체값에서 일부값은 몇프로"
      ..answer = "%",
    MathExpr()
      ..mainCategory = "percent"
      ..subCategory = "percent3"
      ..inputList = ["a", "b"]
      ..inputHints = ["a", "b"]
      ..math = "(b-a)/a*100"
      ..cmd = "a이(가)b로 변경되면"
      ..title = "어떤값이 다른값으로 변경 된 경우, 몇퍼센트 증가/감소"
      ..answer = "%",
    MathExpr()
      ..mainCategory = "percent"
      ..subCategory = "percent4"
      ..inputList = ["a", "b"]
      ..inputHints = ["a", "b"]
      ..math = "a+(a*b/100)"
      ..cmd = "a이(가)b% 증가 하면"
      ..title = "값이 몇프로 증가 하면 결과 값은?",
    MathExpr()
      ..mainCategory = "percent"
      ..subCategory = "percent5"
      ..inputList = ["a", "b"]
      ..inputHints = ["a", "b"]
      ..math = "a-(a*b/100)"
      ..cmd = "a이(가)b% 감소 하면"
      ..title = "값이 몇프로 감소 하면 결과 값은?",
    MathExpr()
      ..mainCategory = "percent"
      ..subCategory = "percent6"
      ..inputList = ["a", "b"]
      ..inputHints = ["a", "b"]
      ..math = "(b*100)/10"
      ..cmd = "a%이(가)b와 같으면?"
      ..title = "A% 가 B 값과 같으면 ",
  ];

  Rxn<MathExpr> curselect = Rxn<MathExpr>();
  Rxn<MathComp> curselectComp = Rxn<MathComp>();

  // var curSelectInput;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // List<Widget> comps = tests.map((e) {
    //   var c = MathComp(mathdata: e);
    //   return Obx(() {
    //     print("::::: $curselectComp ${curselectComp.value == c}");
    //     return c
    //       ..bSelect = curselectComp.value == c
    //       ..onSelect = (v) {
    //         curselectComp(v);
    //       };
    //   });
    // }).toList();
    return Scaffold(
      body: [
        Text(
          "percentage calculator".tr,
          style: Get.textTheme.headlineLarge,
        ),
        [
          ...tests.map((e) {
            return Obx(
              () => MathComp(
                key: Key(e.title),
                mathdata: e,
                curSelect: curselectComp.value,
                onSelect: curselectComp,
              ),
            );
          }),
        ]
            .toColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .scrollable(padding: const EdgeInsets.only(bottom: 50, top: 20))
            .constrained(width: double.infinity)
            .padding(all: 10)
            .expanded(),
        KeyboardComp(
          onlyNumber: true,
          onPressed: (v) {
            if (curselectComp.value != null) {
              curselectComp.value!.onInput(v);
            }
          },
        )
      ].toColumn(),
    );
  }
}
 // Text("전체값의 몇퍼 는 얼마?"),
          // [
          //   Text("123").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text("의"),
          //   EditTextBox(
          //     vlaue: "23%",
          //     bSelect: false,
          //     onSelect: () {
          //       print("onselect");
          //     },
          //   ),
          //   // Text("23%").padding(all: 10).decorated(
          //   //     borderRadius: BorderRadius.circular(5),
          //   //     border: Border.all(
          //   //       color: Colors.white,
          //   //     )),
          //   Text("는 얼마?")
          // ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
          // // -------
          // Text("전체값에서 일부값은 몇프로?"),
          // [
          //   Text("123").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text("에서"),
          //   Text("23").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text("는 몇프로?")
          // ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
          // // -------------------
          // Text("X값이 Y값으로 변경 된 경우, 몇퍼센트 증가/감소?"),
          // [
          //   Text("123").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text("가"),
          //   Text("23").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text("으로 변경 되면?")
          // ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
          // // -------------------
          // Text("값이 몇프로 증가/감소 하면 결과 값은"),
          // [
          //   Text("123").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text("가"),
          //   Text("23").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text("(증가, 감소)")
          // ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
          // // -------------------
          // Text("X% 가 B 와 같으면 결과 값은?"),
          // [
          //   Text("123%").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text(" 가 "),
          //   Text("23").padding(all: 10).decorated(
          //       borderRadius: BorderRadius.circular(5),
          //       border: Border.all(
          //         color: Colors.white,
          //       )),
          //   Text("이면 150 입니다.")
          // ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),