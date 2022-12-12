import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:styled_widget/styled_widget.dart';

class ClcPage extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: [
        Text("숫자 필드").expanded(),
        KeyboardComp(
          onPressed: (v) {
            print(v);
          },
        ),
      ].toColumn(),
    );
  }
}
