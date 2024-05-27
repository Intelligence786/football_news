import 'package:flutter/material.dart';
import 'package:football_news/data/models/news_model/news_model.dart';
import 'package:intl/intl.dart';

import '../../../core/app_export.dart';

class HomeNewsBigWiget extends StatelessWidget {
  HomeNewsBigWiget(this.newsModel, {Key? key})
      : super(
          key: key,
        );
  NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorService.pushNamed(AppRoutes.newsScreen, arguments: newsModel);
      },
      child: Container(
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        width: 250.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomImageView(
              imagePath: newsModel.imgUrl!,
              height: 125.v,
              width: 250.h,
              radius: BorderRadiusStyle.customBorderTop10,
            ),
            SizedBox(height: 8.v),
            Expanded(
              //width: 221.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: Text(
                  newsModel.title!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallSFProText.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: Text(
                DateFormat('MMMM d, hh:mm a').format(newsModel.dateTime!),
                style: theme.textTheme.labelMedium,
              ),
            ),
            SizedBox(height: 10.v)
          ],
        ),
      ),
    );
  }
}
