import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:football_news/core/app_export.dart';
import 'package:football_news/presentation/home_page/widgets/home_match_widget.dart';
import 'package:football_news/presentation/home_page/widgets/home_news_big_widget.dart';
import 'package:football_news/presentation/home_page/widgets/home_news_small_widget.dart';
import 'package:football_news/widgets/app_bar/appbar_title.dart';
import 'package:football_news/widgets/app_bar/custom_app_bar.dart';

import '../../data/data_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppbarTitle(text: 'Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.v,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildMatchesResultCarousel(context),
              SizedBox(
                height: 16.v,
              ),
              _buildBigNewsCarousel(context),
              SizedBox(
                height: 16.v,
              ),
              _buildSmallNewsList(context),
              SizedBox(
                height: 70.v,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMatchesResultCarousel(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last News',
                style: CustomTextStyles.titleMediumMedium,
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadiusStyle.circleBorder16,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.v, horizontal: 4.h),
                  child: Text(
                    'See more',
                    style: CustomTextStyles.titleSmallSFProTextGreen500,
                  ),
                ),
              ),
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
              height: 150.0,
              viewportFraction: 0.6,
              enableInfiniteScroll: false,
              pageSnapping: false,
              disableCenter: true,
              padEnds: false),
          items: DataManager.matches.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 8.v),
                  child: HomeMatchWidget(i),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _buildBigNewsCarousel(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Now',
                style: CustomTextStyles.titleMediumMedium,
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadiusStyle.circleBorder16,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.v, horizontal: 4.h),
                  child: Text(
                    'See more',
                    style: CustomTextStyles.titleSmallSFProTextGreen500,
                  ),
                ),
              ),
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
              height: 250.0,
              viewportFraction: 0.7,
              enableInfiniteScroll: false,
              pageSnapping: false,
              disableCenter: true,
              padEnds: false),
          items: DataManager.getAllNews().map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 8.v),
                  child: HomeNewsBigWiget(i),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _buildSmallNewsList(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last News',
                style: CustomTextStyles.titleMediumMedium,
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadiusStyle.circleBorder16,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.v, horizontal: 4.h),
                  child: Text(
                    'See more',
                    style: CustomTextStyles.titleSmallSFProTextGreen500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.h),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: DataManager.getAllNews().length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: HomeNewsSmallWidget(
                    DataManager.getAllNews()[index],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
