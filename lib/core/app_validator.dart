import 'package:easy_localization/easy_localization.dart';
import 'package:labor/translations/locale_keys.g.dart';

class AppValidator {
  static String? validateCvv(String? cvv) {
    final RegExp digitRegex = RegExp(r'^\d+$');
    if ((cvv!.length < 3 || cvv.length > 4) || !digitRegex.hasMatch(cvv)) {
      return tr(LocaleKeys.filed_required);
    }

    return null;
  }

  static String? validateCardNumber(String? cardNumber) {
    cardNumber = cardNumber?.replaceAll(RegExp(r'[-\s]'), '');

    final RegExp regex = RegExp(r'^[0-9]{13,16}$');
    if (cardNumber == null || !regex.hasMatch(cardNumber)) {
      return tr(LocaleKeys.filed_required);
    }

    int sum = 0;
    bool isSecondDigit = false;
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.tryParse(cardNumber[i]) ?? 0;
      if (isSecondDigit) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      isSecondDigit = !isSecondDigit;
    }

    if (sum % 10 != 0) {
      return tr(LocaleKeys.filed_required);
    }

    return null;
  }
}
