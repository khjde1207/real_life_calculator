import 'package:dio/dio.dart';
import 'package:real_life_calculator/model/isar_model.dart';

class Net {
  static Future<ExchangeCode?> getexchange(
      ExchangeCode form, ExchangeCode to) async {
    ExchangeCode? rtn;
    print(
        "https://quotation-api-cdn.dunamu.com/v1/forex/recent?codes=FRX.${form.code}${to.code}");
    var res = await Dio().get(
        "https://quotation-api-cdn.dunamu.com/v1/forex/recent?codes=FRX.${form.code}${to.code}");
    if (res.data is List<dynamic>) {
      var data = (res.data as List<dynamic>);
      data.forEach((e) {
        print(e["basePrice"]);
        rtn = ExchangeCode()
          ..countryCode = form.countryCode
          ..name = form.name
          ..code = form.code
          ..toCountryCode = to.countryCode
          ..toName = to.name
          ..toCode = to.code
          ..currencyUnit = "${e["currencyUnit"]}"
          ..basePrice = "${e["basePrice"]}"
          ..fullcode = "${form.code}${to.code}"
          ..lastDate = DateTime.now();
      });
    }
    return rtn;
  }
}
