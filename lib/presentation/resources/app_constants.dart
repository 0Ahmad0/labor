class AppConstants {
  const AppConstants._();

  static const int splashDelay = 3;
  static const int defaultDelay = 300;
  static const int itemCountRating = 5;
  static const double widthSize = 428.0;
  static const double heightSize = 926.0;
  static const int onBoardingDelay = 300;
  static const int homeDelay = 3;
  static const int historyTabBarLength = 2;
  static const int minLineContactUsTextFiled = 4;
  static const int maxLineContactUsTextFiled = 6;
  static const int flexExpandedSelectAddress = 2;
}

enum SelectedLanguage { arabic, english }

enum StatusHistoryItem { accept, cancel, done, inReview }

enum NotificationType { confirmed, cancel, reminder }

enum CreditCardTypes {
  americanExpress,
  dinersClub,
  elo,
  hiper,
  jcb,
  maestro,
  masterCard,
  mirPay,
  unionPay,
  visa,
}

enum WalletStatus { add, discount }
