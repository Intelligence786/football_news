import 'package:flutter/material.dart';

class Team {
  final String name;
  final String logoUrl;
  final Color backColor;

  Team({required this.name, required this.logoUrl, required this.backColor});
}

class Game {
  final Team homeTeam;
  final Team awayTeam;
  final String league;
  final DateTime date;

  Game({
    required this.homeTeam,
    required this.awayTeam,
    required this.league,
    required this.date,
  });
}

class MatchResult {
  final Game game;
  final int homeScore;
  final int awayScore;
  final int homePossetion;
  final int awayPossetion;
  final int homeShotsOnTarget;
  final int awayShotsOnTarget;
  final int homeShots;
  final int awayShots;
  final int homeFouls;
  final int awayFouls;
  final int homeCorners;
  final int awayCorners;
  final int homeCornerKicks;
  final int awayCornerKicks;
  final int homeOffsides;
  final int awayOffsides;
  final int homeYellowCards;
  final int awayYellowCards;
  final int homeRedCards;
  final int awayRedCards;
  final int homeFreeKicks;
  final int awayFreeKicks;

  MatchResult(
      {required this.game,
      required this.homeScore,
      required this.homePossetion,
      required this.awayScore,
      required this.awayPossetion,
      required this.homeShotsOnTarget,
      required this.awayShotsOnTarget,
      required this.homeShots,
      required this.awayShots,
      required this.homeFouls,
      required this.awayFouls,
      required this.homeCorners,
      required this.awayCorners,
      required this.homeCornerKicks,
      required this.awayCornerKicks,
      required this.homeOffsides,
      required this.awayOffsides,
      required this.homeYellowCards,
      required this.awayYellowCards,
      required this.homeRedCards,
      required this.awayRedCards,
      required this.homeFreeKicks,
      required this.awayFreeKicks});
}
