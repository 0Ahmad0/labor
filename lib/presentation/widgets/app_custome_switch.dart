import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';

class AppCustomSwitch extends StatefulWidget {
  bool value;

  AppCustomSwitch({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  _AppCustomSwitchState createState() => _AppCustomSwitchState();
}

class _AppCustomSwitchState extends State<AppCustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 46.sp,
        height: 24.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: widget.value ? AppColors.primary : AppColors.greyText,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Positioned(
              left: widget.value ? 10.sp : null,
              right: !widget.value ? 10.sp : null,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 46.sp,
                height: 24.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
