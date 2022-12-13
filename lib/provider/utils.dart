import 'package:decimal/decimal.dart';
import 'package:real_life_calculator/model/isar_model.dart';

class Utils {
  static Decimal clc(List<NumberTypeIsar> clcList) {
    final d = (String s) => Decimal.parse(s);
    Decimal rtnValue = d("0");

    for (var i = 0; i < clcList.length; i++) {
      var curNum = clcList[i];
      var nextNum = i + 1 >= clcList.length ? null : clcList[i + 1];
      print("${curNum.type} : ${curNum.value}");

      if (curNum.type == 0) {
        rtnValue = d(curNum.value);
      }
      if (curNum.type == 1) {
        if (nextNum != null) {
          if (curNum.value == "×") {
            rtnValue = rtnValue * d(nextNum.value);
          }
          if (curNum.value == "+") {
            rtnValue = rtnValue + d(nextNum.value);
          }
          if (curNum.value == "-") {
            rtnValue = rtnValue - d(nextNum.value);
          }
          if (curNum.value == "÷") {
            var tmpValue = rtnValue / d(nextNum.value);
            rtnValue = tmpValue.toDecimal();
          }
          i++;
        }
      }
    }
    // clcList.forEach((e) {

    //   print(e.value);
    // });
    // final d = Decimal.parse("1.4");
    print(" >>>>> ${rtnValue.toString()}");
    return rtnValue;
  }
}
