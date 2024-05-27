import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:football_news/presentation/matches_page/widgets/match_widget.dart';
import 'package:intl/intl.dart';

import '../../core/app_export.dart';
import '../../data/data_manager.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return MatchesPage();
  }

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 9.v,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCalendarTwo(context),
            SizedBox(height: 27.v),
            Text(
              'All Matches',
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 14.v),
            Expanded(child: _buildColumnOfMatches(context)),
            SizedBox(height: 5.v),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: appTheme.gray900,
          type: MaterialType.card,
          child: Container(
            //  height: 400,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                      lastMonthIcon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      nextMonthIcon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      firstDayOfWeek: 1,
                      controlsTextStyle: CustomTextStyles.titleMediumMedium,
                      dayTextStyle: CustomTextStyles.titleMediumMedium,
                      selectedDayTextStyle: CustomTextStyles.titleMedium17,
                      daySplashColor: appTheme.gray50,
                      weekdayLabelTextStyle:
                          CustomTextStyles.labelLargeSemiBold,
                      selectedDayHighlightColor: Colors.transparent),
                  value: [_selectedDate],
                  onValueChanged: (dates) {
                    setState(() {
                      _selectedDate = dates[0]!;
                    });
                    Navigator.pop(
                        context); // Закрываем модальное окно после выбора даты
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: 'Matches',
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMatches,
          margin: EdgeInsets.symmetric(
            horizontal: 25.h,
            vertical: 8.v,
          ),
          onTap: () {
            _showDatePicker();
          },
        )
      ],
    );
  }

  List<DateTime> _generateWeek(DateTime selectedDate) {
    final startOfWeek =
        selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  /// Section Widget
  Widget _buildCalendarTwo(BuildContext context) {
    List<DateTime> weekDays = _generateWeek(_selectedDate);

    return Container(
      height: 100.v,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: weekDays.map((day) {
          bool isSelected = _selectedDate.day == day.day;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = day;
              });
            },
            child: Container(
              width: 51.h,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.E().format(day).substring(0, 1),
                    style: CustomTextStyles.labelLargeSemiBold,
                  ),
                  SizedBox(
                    height: 16.v,
                  ),
                  Text(
                    day.day.toString(),
                    style: isSelected
                        ? CustomTextStyles.titleMedium17
                        : CustomTextStyles.titleMediumMedium,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnOfMatches(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            //  physics: const NeverScrollableScrollPhysics(),
            itemCount: DataManager.getMatchesByDate(_selectedDate).length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: MatchWidget(
                  matchResult:
                      DataManager.getMatchesByDate(_selectedDate)[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
