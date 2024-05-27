import 'package:flutter/material.dart';
import 'package:football_news/data/models/matches_model/matches_model.dart';

import '../../../core/app_export.dart';

class HomeMatchWidget extends StatelessWidget {
  HomeMatchWidget(this.matchResult, {Key? key})
      : super(
          key: key,
        );
  MatchResult matchResult;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorService.pushNamed(AppRoutes.matchInfoScreen,
            arguments: matchResult);
      },
      child: Container(
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        //  width: 191.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.v),
              decoration: AppDecoration.outlineIndigo,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    matchResult.game.league!,
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.v),
            _buildTeamScore(
                context, matchResult.game.homeTeam, matchResult.homeScore),
            SizedBox(height: 4.v),
            _buildTeamScore(
                context, matchResult.game.awayTeam, matchResult.awayScore),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamScore(BuildContext context, Team team, int score) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration:
                AppDecoration.roundedColor.copyWith(color: team.backColor),
            padding: EdgeInsets.all(4.h),
            //color: matchResult.game.awayTeam.backColor,
            child: CustomImageView(
              imagePath: team.logoUrl!,
              height: 32.adaptSize,
              width: 32.adaptSize,
              radius: BorderRadius.circular(
                16.h,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                team.name!,
                style: CustomTextStyles.labelLargeWhiteA700,
              ),
            ),
          ),
          Text(
            score.toString()!,
            style: CustomTextStyles.labelLargeWhiteA700SemiBold,
          )
        ],
      ),
    );
  }
}
