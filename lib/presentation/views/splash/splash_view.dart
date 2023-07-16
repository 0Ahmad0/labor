import 'package:flutter/material.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_routes.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: AppConstants.splashDelay), () {
      Navigator.pushReplacementNamed(context, Routes.selectedLanguage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(AppAssets.logoApp),
      ),
    );
  }
}
