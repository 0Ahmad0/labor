import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../resources/app_values.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.add_address_add_address),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              OSMFlutter(
                isPicker: true,
                showDefaultInfoWindow: true,
                trackMyPosition: true,
                controller: MapController.withPosition(
                    initPosition: GeoPoint(
                  latitude: 47.4358055,
                  longitude: 8.4737324,
                )),
                initZoom: 12,
                minZoomLevel: 8,
                maxZoomLevel: 14,
                stepZoom: 1.0,
                markerOption: MarkerOption(
                    advancedPickerMarker: MarkerIcon(
                  iconWidget: CircleAvatar(
                    radius: AppSize.s60.sp,
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.location_on_rounded,
                      color: AppColors.yellow,
                      size: AppSize.s60.sp,
                    ),
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(AppMargin.m40.sp),
                width: double.infinity,
                height: AppSize.s60.sp,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: AppColors.darkGreen,
                  ),
                  title: Text(
                    'Jiddah Alexander Language School , ALS',
                    overflow: TextOverflow.ellipsis,
                    style: getBoldStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: AppSize.s20.sp,
                right: AppSize.s20.sp,
                child: FloatingActionButton(
                  heroTag: UniqueKey(),
                  backgroundColor: AppColors.white,
                  onPressed: () {},
                  child: Icon(
                    Icons.my_location,
                    color: AppColors.darkGreen,
                  ),
                ),
              )
            ],
          )),
          Container(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.white),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(tr(LocaleKeys.add_address_save)),
            ),
          )
        ],
      ),
    );
  }
}
