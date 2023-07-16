import 'package:flutter/material.dart';
import 'package:labor/presentation/views/add_address/add_address_view.dart';
import 'package:labor/presentation/views/add_card/add_card_view.dart';
import 'package:labor/presentation/views/address/address_view.dart';
import 'package:labor/presentation/views/auth/login/login_view.dart';
import 'package:labor/presentation/views/auth/otp/otp_view.dart';
import 'package:labor/presentation/views/auth/register/register_view.dart';
import 'package:labor/presentation/views/auth/reset_password/reset_password_view.dart';
import 'package:labor/presentation/views/contact_us/contact_us_view.dart';
import 'package:labor/presentation/views/navbar/navbar_view.dart';
import 'package:labor/presentation/views/notification/notification_view.dart';
import 'package:labor/presentation/views/on_boarding/on_boarding_view.dart';
import 'package:labor/presentation/views/payment/payment_view.dart';
import 'package:labor/presentation/views/select_address/select_address_view.dart';
import 'package:labor/presentation/views/splash/splash_view.dart';
import 'package:page_transition/page_transition.dart';

import '../views/edit_profile/edit_profile_view.dart';
import '../views/selected_language/selected_language_view.dart';
import '../views/auth/forget_password/forget_password_view.dart';
import 'app_strings.dart';

class Routes {
  static const String splashRoute = '/';
  static const String selectedLanguage = '/selectedLanguage';
  static const String onBoarding = '/onBoarding';

  ///Auth
  static const String login = '/Login';
  static const String register = '/Register';
  static const String otp = '/OTP';
  static const String resetPassword = '/ResetPassword';
  static const String forgetPassword = '/ForgetPassword';

  //NavBar
  static const String navbar = '/NavBar';
  static const String home = '/Home';
  static const String history = '/History';
  static const String categories = '/Categories';
  static const String profile = '/Profile';

  //Profile
  static const String editProfile = '/EditProfile';
  static const String contactUs = '/ContactUs';
  static const String notifications = '/Notifications';
  static const String payment = '/Payment';
  static const String address = '/Address';
  static const String selectAddress = '/SelectAddress';
  static const String addAddress = '/AddAddress';

  //Payment
  static const String addCard = '/AddCard';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return PageTransition(
            child: SplashView(), type: PageTransitionType.leftToRight);
      case Routes.selectedLanguage:
        return PageTransition(
            child: SelectedLanguageView(),
            type: PageTransitionType.rightToLeft);
      case Routes.onBoarding:
        return PageTransition(
            child: OnBoardingView(), type: PageTransitionType.bottomToTop);
      case Routes.login:
        return PageTransition(
            child: LoginView(), type: PageTransitionType.topToBottom);
      case Routes.register:
        return PageTransition(
            child: RegisterView(), type: PageTransitionType.theme);
      case Routes.otp:
        return PageTransition(
            child: OTPView(), type: PageTransitionType.bottomToTop);
      case Routes.resetPassword:
        return PageTransition(
            child: ResetPasswordView(), type: PageTransitionType.topToBottom);
      case Routes.forgetPassword:
        return PageTransition(
            child: ForgetPasswordView(), type: PageTransitionType.bottomToTop);
      case Routes.navbar:
        return PageTransition(
            child: NavBarView(), type: PageTransitionType.rightToLeft);
      case Routes.addCard:
        return PageTransition(
            child: AddCardView(),
            type: PageTransitionType.size,
            alignment: Alignment.center);
      case Routes.contactUs:
        return PageTransition(
            child: ContactUsView(),
            type: PageTransitionType.size,
            alignment: Alignment.center);
      case Routes.editProfile:
        return PageTransition(
            child: EditProfileView(),
            type: PageTransitionType.fade,
            alignment: Alignment.topRight);
      case Routes.notifications:
        return PageTransition(
            child: NotificationView(),
            type: PageTransitionType.rotate,
            alignment: Alignment.bottomLeft);
      case Routes.payment:
        return PageTransition(
            child: PaymentView(),
            type: PageTransitionType.fade,
            alignment: Alignment.centerRight);
      case Routes.address:
        return PageTransition(
          child: AddressView(),
          type: PageTransitionType.leftToRight,
        );
      case Routes.selectAddress:
        return PageTransition(
          child: SelectAddressView(),
          type: PageTransitionType.topToBottom,
        );
      case Routes.addAddress:
        return PageTransition(
            child: AddAddressView(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomRight);
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
