import 'package:decimal/decimal.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:real_life_calculator/model/isar_model.dart';

class Utils {
  static String? clc(String clcdata) {
    clcdata = clcdata.replaceAll("×", "*");
    clcdata = clcdata.replaceAll("÷", "/");
    try {
      Parser p = Parser();
      Expression exp = p.parse(clcdata);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      return eval.toString();
    } catch (e) {
      return null;
    }
  }

  static String? clcMath(MathExpr math, Map<String, String> inputs) {
    try {
      Parser p = Parser();

      Expression exp = p.parse(math.math);

      ContextModel cm = ContextModel();
      inputs.forEach((key, value) {
        cm.bindVariable(Variable(key), Number(num.parse(value)));
      });
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      return eval.toString();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // static Decimal clc(List<NumberTypeIsar> clcList) {
  //   final d = (String s) => Decimal.parse(s);
  //   Decimal rtnValue = d("0");

  //   for (var i = 0; i < clcList.length; i++) {
  //     var curNum = clcList[i];
  //     var nextNum = i + 1 >= clcList.length ? null : clcList[i + 1];
  //     print("${curNum.type} : ${curNum.value}");

  //     if (curNum.type == 0) {
  //       rtnValue = d(curNum.value);
  //     }
  //     if (curNum.type == 1) {
  //       if (nextNum != null) {
  //         if (curNum.value == "×") {
  //           rtnValue = rtnValue * d(nextNum.value);
  //         }
  //         if (curNum.value == "+") {
  //           rtnValue = rtnValue + d(nextNum.value);
  //         }
  //         if (curNum.value == "-") {
  //           rtnValue = rtnValue - d(nextNum.value);
  //         }
  //         if (curNum.value == "÷") {
  //           var tmpValue = rtnValue / d(nextNum.value);
  //           rtnValue = tmpValue.toDecimal();
  //         }
  //         i++;
  //       }
  //     }
  //   }
  //   // clcList.forEach((e) {

  //   //   print(e.value);
  //   // });
  //   // final d = Decimal.parse("1.4");
  //   print(" >>>>> ${rtnValue.toString()}");
  //   return rtnValue;
  // }
}
