class AppCreditCard {
  static String maskCreditCardNumber(String cardNumber) {
    RegExp regex = RegExp(r'^[0-9]{16}$');
    if (regex.hasMatch(cardNumber)) {
      String maskedNumber = '';
      maskedNumber += cardNumber.substring(0, 4) + ' ';
      maskedNumber += ' - XXXX - XXXX - ';
      maskedNumber += cardNumber.substring(12);
      return maskedNumber;
    } else {
      return 'Invalid credit card number';
    }
  }
}
