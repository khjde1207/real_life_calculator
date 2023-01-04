import 'package:decimal/decimal.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      var lastidx = eval.toString().indexOf(".");
      if (lastidx > 0) {
        var ls = eval.toString().substring(lastidx).indexOf("0");
        if (ls > 0) {
          // print();
          ls -= 1;
          return eval.toStringAsFixed(ls);
        }
      }
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

      var lastidx = eval.toString().indexOf(".");

      if (lastidx > 0) {
        var ls = eval.toString().substring(lastidx).indexOf("0");

        if (ls > 0) {
          // print();
          ls -= 1;

          return eval.toStringAsFixed(ls);
        }
        return eval.toString();
      }
      return eval.toStringAsFixed(4);
    } catch (e) {
      return null;
    }
  }

  static numberFormat(double number) {
    String cutomSymbol = "";
    if (number.isNaN) {
      number = 0;
    }
    NumberFormat format =
        NumberFormat.currency(locale: "ko", symbol: cutomSymbol);
    return format.format(number);
  }

  static List<ExchangeCode> getExchangeList() {
    var rtnList = [
      ExchangeCode()
        ..countryCode = "KR"
        ..name = "korea".tr
        ..code = "KRW",
      ExchangeCode()
        ..countryCode = "ZA"
        ..name = "Republic of South Africa".tr
        ..code = "ZAR",
      ExchangeCode()
        ..countryCode = "NP"
        ..name = "Nepal".tr
        ..code = "NPR",
      ExchangeCode()
        ..countryCode = "NO"
        ..name = "Norway".tr
        ..code = "NOK",
      ExchangeCode()
        ..countryCode = "NZ"
        ..name = "New Zealand".tr
        ..code = "NZD",
      ExchangeCode()
        ..countryCode = "TW"
        ..name = "taiwan".tr
        ..code = "TWD",
      ExchangeCode()
        ..countryCode = "DK"
        ..name = "Denmark".tr
        ..code = "DKK",
      ExchangeCode()
        ..countryCode = "RU"
        ..name = "Russia".tr
        ..code = "RUB",
      ExchangeCode()
        ..countryCode = "MO"
        ..name = "Macau".tr
        ..code = "MOP",
      ExchangeCode()
        ..countryCode = "MY"
        ..name = "Malaysia".tr
        ..code = "MYR",
      ExchangeCode()
        ..countryCode = "MX"
        ..name = "Mexico".tr
        ..code = "MXN",
      ExchangeCode()
        ..countryCode = "MN"
        ..name = "Mongolia".tr
        ..code = "MNT",
      ExchangeCode()
        ..countryCode = "US"
        ..name = "United States of America".tr
        ..code = "USD",
      ExchangeCode()
        ..countryCode = "BH"
        ..name = "Bahrain".tr
        ..code = "BHD",
      ExchangeCode()
        ..countryCode = "BD"
        ..name = "Bangladesh".tr
        ..code = "BDT",
      ExchangeCode()
        ..countryCode = "VN"
        ..name = "Vietnam".tr
        ..code = "VND",
      ExchangeCode()
        ..countryCode = "BR"
        ..name = "brazil".tr
        ..code = "BRL",
      ExchangeCode()
        ..countryCode = "BN"
        ..name = "Brunei".tr
        ..code = "BND",
      ExchangeCode()
        ..countryCode = "SA"
        ..name = "Saudi Arabia".tr
        ..code = "SAR",
      ExchangeCode()
        ..countryCode = "SE"
        ..name = "Sweden".tr
        ..code = "SEK",
      ExchangeCode()
        ..countryCode = "CH"
        ..name = "Swiss".tr
        ..code = "CHF",
      ExchangeCode()
        ..countryCode = "SG"
        ..name = "Singapore".tr
        ..code = "SGD",
      ExchangeCode()
        ..countryCode = "AE"
        ..name = "United Arab Emirates".tr
        ..code = "AED",
      ExchangeCode()
        ..countryCode = "GB"
        ..name = "England".tr
        ..code = "GBP",
      ExchangeCode()
        ..countryCode = "OM"
        ..name = "Oman".tr
        ..code = "OMR",
      ExchangeCode()
        ..countryCode = "JO"
        ..name = "Jordan".tr
        ..code = "JOD",
      ExchangeCode()
        ..countryCode = "EU"
        ..name = "European Union".tr
        ..code = "EUR",
      ExchangeCode()
        ..countryCode = "IL"
        ..name = "Israel".tr
        ..code = "ILS",
      ExchangeCode()
        ..countryCode = "EG"
        ..name = "Egypt".tr
        ..code = "EGP",
      ExchangeCode()
        ..countryCode = "IN"
        ..name = "India".tr
        ..code = "INR",
      ExchangeCode()
        ..countryCode = "ID"
        ..name = "Indonesia".tr
        ..code = "IDR",
      ExchangeCode()
        ..countryCode = "JP"
        ..name = "japan".tr
        ..code = "JPY",
      ExchangeCode()
        ..countryCode = "CN"
        ..name = "China".tr
        ..code = "CNY",
      ExchangeCode()
        ..countryCode = "CZ"
        ..name = "Czech Republic".tr
        ..code = "CZK",
      ExchangeCode()
        ..countryCode = "CL"
        ..name = "Chile".tr
        ..code = "CLP",
      ExchangeCode()
        ..countryCode = "KZ"
        ..name = "Kazakhstan".tr
        ..code = "KZT",
      ExchangeCode()
        ..countryCode = "QA"
        ..name = "catarrh".tr
        ..code = "QAR",
      ExchangeCode()
        ..countryCode = "CA"
        ..name = "Canada".tr
        ..code = "CAD",
      ExchangeCode()
        ..countryCode = "KW"
        ..name = "Kuwait".tr
        ..code = "KWD",
      ExchangeCode()
        ..countryCode = "TH"
        ..name = "Thailand".tr
        ..code = "THB",
      ExchangeCode()
        ..countryCode = "TR"
        ..name = "turkiye".tr
        ..code = "TRY",
      ExchangeCode()
        ..countryCode = "PK"
        ..name = "Pakistan".tr
        ..code = "PKR",
      ExchangeCode()
        ..countryCode = "PL"
        ..name = "Poland".tr
        ..code = "PLN",
      ExchangeCode()
        ..countryCode = "PH"
        ..name = "Philippine".tr
        ..code = "PHP",
      ExchangeCode()
        ..countryCode = "HU"
        ..name = "Hungary".tr
        ..code = "HUF",
      ExchangeCode()
        ..countryCode = "AU"
        ..name = "australia".tr
        ..code = "AUD",
      ExchangeCode()
        ..countryCode = "HK"
        ..name = "Hong Kong".tr
        ..code = "HKD",
    ];
    return rtnList;
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
