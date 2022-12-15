import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_eval/dart_eval.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_parser/math_parser.dart';
import 'package:real_life_calculator/comp/icon_data.dart';
import 'package:real_life_calculator/comp/keyboard_comp.dart';
import 'package:real_life_calculator/model/isar_model.dart';
import 'package:real_life_calculator/provider/utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ClcPage extends GetView {
  RxList<NumberTypeIsar> clcList = RxList<NumberTypeIsar>();
  String curNums = "";
  Rx<Decimal> rtnValue = Decimal.parse("0").obs;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: [
        Obx(() {
          if (clcList.isEmpty) {
            return SizedBox();
          }
          // print("LLLLLLLLLLLLLLLL$clcList");
          var t = clcList;
          // .getRange(
          //     (clcList.length - 30).clamp(0, clcList.length), clcList.length);
          return LayoutBuilder(builder: (p0, p1) {
            print(p1.maxHeight ~/ (43));

            return t
                .map((e) {
                  return AutoSizeText(
                    e.value,
                    maxFontSize: 42,
                    minFontSize: e.type == 0 ? 42 : 24,
                    textAlign: TextAlign.end,
                    maxLines: p1.maxHeight ~/ (43 * 2),
                  )
                      // Text(e.value)
                      //     .fontSize(e.type == 0 ? 32 : 24)
                      //     .textColor(Colors.white.withOpacity(0.8))
                      //     // .backgroundColor(Colors.white)
                      .marginSymmetric(horizontal: 2);
                })
                .toList()
                .toWrap(
                  alignment: WrapAlignment.end,
                  runAlignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  clipBehavior: Clip.hardEdge,
                );
          });
        }).width(double.infinity).marginSymmetric(horizontal: 20).expanded(),
        // Divider(),

        Obx(() {
          return [
            AutoSizeText(
              rtnValue.toString(),
              maxLines: 1,
              maxFontSize: 42,
              minFontSize: 42,
              textAlign: TextAlign.right,
            ).marginOnly(right: 10).expanded(),
            IconsData.eq(color: Colors.white),
          ]
              .toRow(mainAxisAlignment: MainAxisAlignment.end)
              .marginSymmetric(horizontal: 10);
        }),
        Divider(),
        // Obx(() {
        //   return [
        //     AutoSizeText(
        //       clcList.isNotEmpty && clcList.last.type == 0
        //           ? clcList.last.value
        //           : "",
        //       maxFontSize: 42,
        //       minFontSize: 42,
        //       textAlign: TextAlign.right,
        //     ).marginSymmetric(horizontal: 10).expanded(),
        //     IconButton(
        //       onPressed: () {
        //         if (clcList.isNotEmpty) {
        //           if (clcList.last.type == 0 && clcList.last.value.isNotEmpty) {
        //             clcList.last.value = clcList.last.value
        //                 .substring(0, clcList.last.value.length - 1);
        //             clcList.refresh();
        //             return;
        //           }
        //           if (clcList.last.type == 0 && clcList.last.value.isEmpty) {
        //             clcList.removeLast();
        //             // if (clcList.isNotEmpty) {
        //             //   clcList.removeLast();
        //             // }
        //           } else {
        //             clcList.removeLast();
        //           }
        //           clcList.refresh();
        //           rtnValue(Utils.clc(clcList));
        //         }
        //       },
        //       icon: Icon(
        //         Icons.backspace,
        //         size: 42,
        //       ),
        //     ),
        //   ].toRow(mainAxisAlignment: MainAxisAlignment.end);
        // }),
        // Divider().marginOnly(bottom: 10),
        // Text("숫자 필드"),
        // ElevatedButton(
        //   onPressed: () {
        //     Utils.clc(clcList);
        //   },
        //   child: Text("Test"),
        // ),
        KeyboardComp(
          onPressed: (v) {
            // print(v.value);

            // var e = eval('Decimal.parse(2) + Decimal.parse(2)');
            var ss = MathCustomFunctionsImplemented({MathFunctionT1()});
            var s = MathNodeExpression.fromString("4+-2");
            var rtn = s.calc(MathVariableValues({}));
            // print(s.);
            var lastidx = rtn.toString().indexOf(".");
            if (lastidx > 0) {
              var ls = rtn.toString().substring(lastidx).indexOf("0");
              if (ls > 0) {
                // print();
                ls -= 1;
                print(rtn.toStringAsFixed(ls));
                return;
              }
            }
            print(rtn.toInt());

            // Parser p = Parser();
            // Expression exp = p.parse("2+2");
            // ContextModel ctx = ContextModel();
            // double eval = exp.evaluate(EvaluationType.REAL, ctx);

            // print(eval);
            // final source = '''
            //     import 'package:decimal/decimal.dart';
            //     String main() {

            //       return Decimal.parse('1');
            //     }
            // ''';
            // final compiler = Compiler();
            // var e = eval(source,
            //     function: "main",
            //     compilerSettings: (compiler) {},
            //     runtimeSettings: (runtime) {});
            //; final program = compiler.compile({
            //   'example': {'main.dart': source}
            // });

            // final runtime = Runtime.ofProgram(program)
            //   ..registerBridgeFunc('package:decimal/decimal.dart', 'decimal',
            //       (runtime, target, args) {
            //     print(runtime);
            //     print(target);
            //     print(args);
            //   });
            // runtime.setup();
            // var e = runtime.executeLib('package:example/main.dart', 'main');
            // print(e);

            return;
            if (v.value == "AC") {
              clcList.clear();
              rtnValue(Utils.clc(clcList));
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
            if (clcList.isNotEmpty && clcList.last.type == 0 && v.type == 1) {
              var bClc = [
                "%",
                "()",
                "÷",
                "×",
                "-",
                "+",
              ].contains(v.value);
              if (bClc) {
                clcList.add(v);
              }
            }
            // print(v);
            clcList.refresh();
            rtnValue(Utils.clc(clcList));
            // clcList.forEach((e) {
            //   print(e.value);
            // });
          },
        ),
      ].toColumn(),
    );
  }
}

class MathFunctionT1 implements MathDefinitionFunctionFreeformImplemented {
  @override
  final name = '*';
  @override
  final minArgumentsCount = 1;
  @override
  final maxArgumentsCount = 1;

  @override
  num calc(
    List<MathNode> args,
    MathVariableValues values, {
    required MathCustomFunctionsImplemented customFunctions,
  }) {
    print(args[0]);
    return 2 * args[0].calc(values, customFunctions: customFunctions);
  }

  @override
  bool hasSameName(String other) {
    return other == name;
  }

  @override
  bool isCompatible(MathDefinitionFunctionFreeform other) {
    return hasSameName(other.name) &&
        minArgumentsCount == other.minArgumentsCount &&
        maxArgumentsCount == other.maxArgumentsCount;
  }

  const MathFunctionT1();
}
