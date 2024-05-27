import 'package:flutter/material.dart';
import 'package:football_news/data/models/news_model/news_model.dart';
import 'package:intl/intl.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key, required this.newsModel})
      : super(
          key: key,
        );

  final NewsModel newsModel;

  static Widget builder(BuildContext context, NewsModel newsModel) {
    return NewsScreen(newsModel: newsModel);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 1.v),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: newsModel.imgUrl,
                    height: 214.v,
                    width: 389.h,
                  ),
                  SizedBox(height: 16.v),
                  _buildRowByAuthor(context),
                  SizedBox(height: 14.v),
                  Container(
                    width: 348.h,
                    margin: EdgeInsets.only(
                      left: 16.h,
                      right: 25.h,
                    ),
                    child: Text(
                      newsModel.title!,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLarge23.copyWith(
                        height: 1.17,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.v),
                  Container(
                   // width: 358.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Text(
                      newsModel.body!,
                     // maxLines: 59,
                      overflow: TextOverflow.visible,
                      style: CustomTextStyles.titleMediumMedium.copyWith(
                        height: 1.29,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 42.v,
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,

        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: 'Home',
      ),
    );
  }

  /// Section Widget
  Widget _buildRowByAuthor(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //width: 151.h,
            padding: EdgeInsets.all(8.h),
            decoration: AppDecoration.fillIndigo.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By ',
                    style: CustomTextStyles.titleSmallSFProTextIndigo50_1,
                  ),

                  TextSpan(
                    text: newsModel.author,
                    style: CustomTextStyles.titleSmallSFProTextGreen500_1,
                  )
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          CustomElevatedButton(
            width: 127.h,
            text: DateFormat('MMMM d, hh:mm a').format(newsModel.dateTime!),
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
