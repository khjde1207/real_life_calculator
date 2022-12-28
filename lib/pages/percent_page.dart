import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:styled_widget/styled_widget.dart';

class PercentPageCtl extends GetxController {
  int curSelectBox = 0;
}

class PercentPage extends GetView {
  // var curSelectInput;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: [
        [
          Text("전체값의 몇퍼 는 얼마?"),
          [
            Text("123").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("의"),
            Text("23%").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("는 얼마?")
          ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
          // -------
          Text("전체값에서 일부값은 몇프로?"),
          [
            Text("123").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("에서"),
            Text("23").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("는 몇프로?")
          ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
          // -------------------
          Text("X값이 Y값으로 변경 된 경우, 몇퍼센트 증가/감소?"),
          [
            Text("123").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("가"),
            Text("23").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("으로 변경 되면?")
          ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
          // -------------------
          Text("값이 몇프로 증가/감소 하면 결과 값은"),
          [
            Text("123").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("가"),
            Text("23").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("(증가, 감소)")
          ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
          // -------------------
          Text("X% 가 B 와 같으면 결과 값은?"),
          [
            Text("123%").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text(" 가 "),
            Text("23").padding(all: 10).decorated(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                )),
            Text("이면 150 입니다.")
          ].toWrap(crossAxisAlignment: WrapCrossAlignment.center).marginAll(10),
        ]
            .toColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .scrollable()
            .constrained(width: double.infinity)
            .padding(all: 10)
            .expanded(),
        KeyboardComp(
          onlyNumber: true,
          onPressed: (v) {},
        )
      ].toColumn(),
    );
  }
}
