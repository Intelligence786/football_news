import 'package:flutter/material.dart';
import 'package:football_news/data/models/news_model/news_model.dart';
import 'package:intl/intl.dart';
import '../../../core/app_export.dart';

class HomeNewsSmallWidget extends StatelessWidget {
  HomeNewsSmallWidget(this.newsModel, {Key? key})
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
        child: Row(
          children: [
            CustomImageView(
              imagePath: newsModel.imgUrl!,
              height: 104.adaptSize,
              width: 104.adaptSize,
              radius: BorderRadiusStyle.customBorderTL10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 18.v,
                bottom: 15.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 214.h,
                    child: Text(
                      newsModel.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallSFProText.copyWith(
                        height: 1.47,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    DateFormat('MMMM d, hh:mm a').format(newsModel.dateTime!),
                    style: CustomTextStyles.labelLargeSemiBold,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
