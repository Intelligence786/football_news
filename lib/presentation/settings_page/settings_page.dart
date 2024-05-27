import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Widget builder(BuildContext context) {
    return SettingsPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppbarTitle(text: 'Settings'),
        centerTitle: true,
        styleType: Style.bgFill,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.h),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.v),
                    decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: _buildSettingsButtonWithout(
                      context,
                      name: 'Ask of Question',
                      imagePath: ImageConstant.imgAsk,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 16.v,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.v),
                    decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Column(
                      children: [
                        _buildSettingsButton(
                          context,
                          name: 'Privacy Policy',
                          imagePath: ImageConstant.imgPrivacy,
                          onTap: () {},
                        ),
                        _buildSettingsButtonWithout(
                          context,
                          name: 'Terms of Use',
                          imagePath: ImageConstant.imgTerms,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.v,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.v),
                    decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Column(
                      children: [
                        _buildSettingsButton(
                          context,
                          name: 'Share app',
                          imagePath: ImageConstant.imgShare,
                          onTap: () {},
                        ),
                        _buildSettingsButtonWithout(
                          context,
                          name: 'Rate the app',
                          imagePath: ImageConstant.imgRate,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.v,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.v),
                    decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: _buildSettingsButtonWithout(
                      context,
                      name: 'About app',
                      imagePath: ImageConstant.imgAbout,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsButton(BuildContext context,
      {String name = '', String imagePath = '', Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 12.v),
            color: appTheme.green500,
          ),
          Expanded(
            child: Container(
              decoration: AppDecoration.outlineIndigo,
              margin: EdgeInsets.only(left: 8.h),
              padding: EdgeInsets.only(top: 12.v, bottom: 11.v),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      name,
                      style: CustomTextStyles.titleSmallSFPro,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20.v,
                    color: Colors.white.withAlpha(100),

                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsButtonWithout(BuildContext context,
      {String name = '', String imagePath = '', Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 12.v),
            color: appTheme.green500,
          ),
          Expanded(
            child: Container(
              //  decoration: AppDecoration.outlineOnPrimaryContainer,
              margin: EdgeInsets.only(left: 8.h),
              padding: EdgeInsets.only(top: 12.v, bottom: 12.v),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      name,
                      style: CustomTextStyles.titleSmallSFPro,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withAlpha(100),
                    size: 20.v,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
