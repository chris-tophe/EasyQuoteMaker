import 'package:easy_quote_maker/component/text_fill.dart';

class Validator {

  static Function _isNotEmpty = (String value){
    if (value.isEmpty) {
      return TextFill.notEmptyField;
    }
    return null;
  };
  static Function get isNotEmpty => _isNotEmpty;

  static Function _isValidPassword = (String value){
    if (value.length < 4 ) {
      return TextFill.passwordRule;
    }
    return null;
  };
  static Function get isValidPassword => _isValidPassword;
}