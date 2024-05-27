import 'package:flutter/material.dart';
import 'package:football_news/data/models/matches_model/matches_model.dart';
import 'package:intl/intl.dart';

import '../../../core/app_export.dart';

class MatchWidget extends StatelessWidget {
  MatchWidget({super.key, required this.matchResult});

  final MatchResult matchResult;

  bool isPast() {
    if (matchResult.game.date.millisecondsSinceEpoch <
        DateTime.now().millisecondsSinceEpoch) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorService.pushNamed(AppRoutes.matchInfoScreen,
            arguments: matchResult);
      },
      child: Container(
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 7.v,
              ),
              decoration: AppDecoration.outlineIndigo,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      matchResult.game.league,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text(
                      isPast()
                          ? 'FT'
                          : DateFormat.jm().format(matchResult.game.date),
                      style: CustomTextStyles.labelLargeGreen500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 14.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: AppDecoration.roundedColor
                        .copyWith(color: matchResult.game.homeTeam.backColor),
                    padding: EdgeInsets.all(2.h),
                    margin: EdgeInsets.only(right: 8.h),
                    //color: matchResult.game.awayTeam.backColor,
                    child: CustomImageView(
                      imagePath: matchResult.game.homeTeam.logoUrl!,
                      height: 30.adaptSize,
                      width: 30.adaptSize,
                      radius: BorderRadius.circular(
                        16.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90.h,
                    child: Text(
                      matchResult.game.homeTeam.name,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      style: CustomTextStyles.titleSmallSFProTextMedium,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    isPast()
                        ? '${matchResult.homeScore}:${matchResult.awayScore}'
                        : 'VS',
                    style: theme.textTheme.titleLarge,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: 90.h,
                    child: Text(
                      matchResult.game.awayTeam.name,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.visible,
                      style: CustomTextStyles.titleSmallSFProTextMedium_1,
                    ),
                  ),
                  Container(
                    decoration: AppDecoration.roundedColor
                        .copyWith(color: matchResult.game.awayTeam.backColor),
                    padding: EdgeInsets.all(2.h),
                    margin: EdgeInsets.only(left: 8.h),
                    //color: matchResult.game.awayTeam.backColor,
                    child: CustomImageView(
                      imagePath: matchResult.game.awayTeam.logoUrl!,
                      height: 30.adaptSize,
                      width: 30.adaptSize,
                      radius: BorderRadius.circular(
                        16.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.v),
            Text(
              DateFormat('EEE, M/d').format(matchResult.game.date),
              style: CustomTextStyles.labelLargeSFProDisplay,
            ),
            SizedBox(height: 14.v),
          ],
        ),
      ),
    );
  }
}
