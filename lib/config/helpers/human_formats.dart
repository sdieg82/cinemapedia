import 'package:intl/intl.dart';

class HumanFormats {

  static String number(num number){
    return NumberFormat.compact(locale: 'en').format(number);
  }

}