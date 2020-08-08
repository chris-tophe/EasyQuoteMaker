import 'package:easy_quote_maker/component/logger.dart';
import 'package:easy_quote_maker/component/text_fill.dart';

class Validator {
  static Function isNotEmpty = (String value) {
    if (value.isEmpty) {
      return TextFill.notEmptyField;
    }
    return null;
  };

  static Function isValidPassword = (String value) {
    if (value.length < 4) {
      return TextFill.passwordRule;
    }
    return null;
  };

  static Function isValidUsername = (String value) {
    if (value.length < 4 || value.length > 9) return TextFill.usernameRule;
    return null;
  };

  static Function isSame = (String s1, String s2) {
    if (s1.isEmpty) {
      return TextFill.notEmptyField;
    }
    if (s1 != s2) {
      return TextFill.notTheSame;
    }
    return null;
  };

  static Function isValidEmail = (String value){
    RegExp pattern = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (!pattern.hasMatch(value)) return TextFill.notValidEmail;
    return null;
  };
}
