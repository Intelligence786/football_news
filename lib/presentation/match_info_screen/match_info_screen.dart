import 'package:flutter/material.dart';
import 'package:football_news/core/app_export.dart';
import 'package:football_news/data/models/matches_model/matches_model.dart';
import 'package:intl/intl.dart';

import '../../data/data_manager.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../matches_page/widgets/match_widget.dart';

class MatchInfoScreen extends StatelessWidget {
  MatchInfoScreen({super.key, required this.matchResult});

  final MatchResult matchResult;

  static Widget builder(BuildContext context, MatchResult matchResult) {
    return MatchInfoScreen(matchResult: matchResult);
  }

  bool isPast() {
    if (matchResult.game.date.millisecondsSinceEpoch <
        DateTime.now().millisecondsSinceEpoch) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -180,
            right: 1,
            left: 1,
            child: CustomImageView(
              //   color: appTheme.whiteA700.withOpacity(0.5),
              //margin: EdgeInsets.only(bottom: 600.v),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
              imagePath: ImageConstant.imgResultBack,
            ),
          ),
          Container(
            decoration: AppDecoration.fillGray
                .copyWith(color: appTheme.black900.withOpacity(0.5)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150.v),
            child: Column(
              children: [
                _matchWidget(context),
                SizedBox(
                  height: 50.v,
                ),
                Expanded(
                  child: isPast()
                      ? _buildStatistic(context)
                      : _buildPastGames(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _matchWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: AppDecoration.roundedColor
                        .copyWith(color: matchResult.game.homeTeam.backColor),
                    padding: EdgeInsets.all(16.h),

                    //color: matchResult.game.awayTeam.backColor,
                    child: CustomImageView(
                      imagePath: matchResult.game.homeTeam.logoUrl!,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      radius: BorderRadius.circular(
                        1.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  SizedBox(
                    width: 90.h,
                    child: Text(
                      matchResult.game.homeTeam.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: CustomTextStyles.titleSmallSFProTextMedium,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  Text(
                    isPast()
                        ? '${matchResult.homeScore} - ${matchResult.awayScore}'
                        : 'VS',
                    style: theme.textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  Text(
                    isPast()
                        ? 'FT'
                        : DateFormat('EEE, M/d').format(matchResult.game.date),
                    style: CustomTextStyles.titleSmallSFProTextIndigo50,
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: AppDecoration.roundedColor
                        .copyWith(color: matchResult.game.awayTeam.backColor),
                    padding: EdgeInsets.all(16.h),
                    //color: matchResult.game.awayTeam.backColor,
                    child: CustomImageView(
                      imagePath: matchResult.game.awayTeam.logoUrl!,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      radius: BorderRadius.circular(
                        1.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  SizedBox(
                    width: 90.h,
                    child: Text(
                      matchResult.game.awayTeam.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: CustomTextStyles.titleSmallSFProTextMedium_1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatistic(BuildContext context) {
    return Column(
      children: [
        Text(
          'Statistic',
          style: theme.textTheme.titleMedium,
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildStatsTable(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPastGames(BuildContext context) {
    final List<MatchResult> matches = DataManager.getMatchesByTeam(
        matchResult.game.homeTeam, matchResult.game.awayTeam);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Past Games',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 10.0), // Добавим отступ между текстом и списком
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.v),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: matches.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: MatchWidget(
                    matchResult: matches[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsTable() {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(1),
      },
      children: [
        _buildStatsRow('Possetion %', matchResult.homePossetion,
            matchResult.awayPossetion),
        _buildStatsRow('Shots On Target', matchResult.homeShotsOnTarget,
            matchResult.awayShotsOnTarget,
            percent: true),
        _buildStatsRow('Shots', matchResult.homeShots, matchResult.awayShots,
            percent: true),
        _buildStatsRow('Fouls', matchResult.homeFouls, matchResult.awayFouls,
            percent: true),
        _buildStatsRow(
            'Corners', matchResult.homeCorners, matchResult.awayCorners),
        _buildStatsRow(
            'Free kicks', matchResult.homeFreeKicks, matchResult.awayFreeKicks),
        _buildStatsRow('Corner Kicks', matchResult.homeCornerKicks,
            matchResult.awayCornerKicks),
        _buildStatsRow(
            'Offsides', matchResult.homeOffsides, matchResult.awayOffsides),
        _buildStatsRow('Yellow Cards', matchResult.homeYellowCards,
            matchResult.awayYellowCards),
        _buildStatsRow(
            'Red Cards', matchResult.homeRedCards, matchResult.awayRedCards),
      ],
    );
  }

  TableRow _buildStatsRow(String label, int homeValue, int awayValue,
      {bool percent = false}) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Text(
              homeValue.toString(),
              textAlign: TextAlign.left,
              style: CustomTextStyles.titleSmallSFPro,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleSmallSFProTextIndigo50,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Text(
              awayValue.toString(),
              textAlign: TextAlign.right,
              style: CustomTextStyles.titleSmallSFPro,
            ),
          ),
        ),
      ],
    );
  }

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
        text: isPast() ? 'Match Results' : 'Upcoming match',
      ),
    );
  }

  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
