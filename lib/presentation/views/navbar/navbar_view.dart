import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/views/navbar/screens_navbar/categories_view.dart';
import 'package:labor/presentation/views/navbar/screens_navbar/history_view.dart';
import 'package:labor/presentation/views/navbar/screens_navbar/home_view.dart';
import 'package:labor/presentation/views/navbar/screens_navbar/profile_view.dart';
import 'package:labor/translations/locale_keys.g.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _currentIndex = 0;
  late List<Map<String, dynamic>> _screens;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _screens = [
      {"title": "Home", "icon": AppAssets.home},
      {"title": "Orders", "icon": AppAssets.orders},
      {"title": "DashBoard", "icon": AppAssets.dashboard},
      {"title": "User", "icon": AppAssets.user}
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomeView(),
          HistoryView(),
          CategoriesView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(_currentIndex,
                duration: Duration(milliseconds: AppConstants.onBoardingDelay),
                curve: Curves.easeInOut);
          });
        },
        currentIndex: _currentIndex,
        items: [
          for (int i = 0; i < _screens.length; i++)
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _screens[i]['icon'],
                  color:
                      _currentIndex == i ? AppColors.primary : AppColors.grey,
                ),
                label: ''),
        ],
      ),
    );
  }
}
