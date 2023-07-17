import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_theme.dart';
import 'presentation/resources/app_routes.dart';
import 'presentation/resources/app_strings.dart';
import 'translations/codegen_loader.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
}

class MyApp extends StatelessWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal(); // singletone class

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppConstants.widthSize, AppConstants.heightSize),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          title: AppStrings.appName,
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesGenerator.getRoute,
          initialRoute: Routes.splashRoute,
        );
      },
    );
  }
}
/*
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations" -o "locale_keys.g.dart" -f keys

 */
