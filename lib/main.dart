import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_theme.dart';
import 'package:labor/presentation/views/orders/complete_order_view.dart';
import 'package:labor/presentation/views/orders/order_details_view.dart';
import 'presentation/resources/app_routes.dart';
import 'presentation/resources/app_strings.dart';
import 'translations/codegen_loader.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(
      EasyLocalization(
        path: 'assets/translations/',
        supportedLocales: [
          Locale("en"),
          Locale("ar"),
        ],
        fallbackLocale: Locale("ar"),
        assetLoader: CodegenLoader(),
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal(); // singletone class

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('ar'));
    return ScreenUtilInit(
      designSize: Size(AppConstants.widthSize, AppConstants.heightSize),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          supportedLocales: context.supportedLocales,
          // localizationsDelegates: context.localizationDelegates,
          localizationsDelegates: [
            CountryLocalizations.delegate,
          ]..addAll(context.localizationDelegates),
          title: AppStrings.appName,
          locale: Locale('ar'),
          theme: AppTheme.appThemeAr,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesGenerator.getRoute,
          initialRoute: Routes.splashRoute,
          // home: CompleteOrderView(),
        );
      },
    );
  }
}
/*
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations" -o "locale_keys.g.dart" -f keys
 */
