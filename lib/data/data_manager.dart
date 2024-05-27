import 'package:flutter/material.dart';
import 'package:football_news/core/app_export.dart';

import 'models/matches_model/matches_model.dart';
import 'models/news_model/news_model.dart';

class DataManager {
  static final String _key = 'analysis_model';

  static List<Team> teams = [
    Team(
      name: "Bayern",
      logoUrl: ImageConstant.imgTeam1,
      backColor: Colors.lightBlueAccent,
    ),
    Team(
      name: "Borussia D",
      logoUrl: ImageConstant.imgTeam2,
      backColor: Colors.black,
    ),
    Team(
      name: "PSG",
      logoUrl: ImageConstant.imgTeam3,
      backColor: Colors.blue,
    ),
    Team(
      name: "Real Madrid",
      logoUrl: ImageConstant.imgTeam4,
      backColor: Colors.white,
    ),
    Team(
      name: "Emerald Legion",
      logoUrl: ImageConstant.imgTeam5,
      backColor: Colors.blue,
    ),
    Team(
      name: "United Eagles",
      logoUrl: ImageConstant.imgTeam6,
      backColor: Colors.blue,
    ),
    Team(
      name: "Crimson Tide",
      logoUrl: ImageConstant.imgTeam7,
      backColor: Colors.blue,
    ),
    Team(
      name: "Phoenix United",
      logoUrl: ImageConstant.imgTeam8,
      backColor: Colors.blue,
    ),
    Team(
      name: "Zenith Wanderers",
      logoUrl: ImageConstant.imgTeam9,
      backColor: Colors.blue,
    ),
    Team(
      name: "Nightfall Guardians",
      logoUrl: ImageConstant.imgTeam10,
      backColor: Colors.blue,
    ),
  ];

  static List<MatchResult> matches = [
    MatchResult(
      game: Game(
        homeTeam: teams[0],
        awayTeam: teams[1],
        league: "UEFA Champions League | 1/2 Finals",
        date: DateTime.now().add(Duration(days: -2)),
      ),
      homeScore: 2,
      awayScore: 0,
      homePossetion: 54,
      awayPossetion: 46,
      homeShotsOnTarget: 5,
      awayShotsOnTarget: 4,
      homeShots: 25,
      awayShots: 18,
      homeFouls: 31,
      awayFouls: 68,
      homeCorners: 42,
      awayCorners: 57,
      homeCornerKicks: 11,
      awayCornerKicks: 7,
      homeOffsides: 12,
      awayOffsides: 3,
      homeYellowCards: 2,
      awayYellowCards: 3,
      homeRedCards: 1,
      awayRedCards: 1,
      homeFreeKicks: 12,
      awayFreeKicks: 14,
    ),
    MatchResult(
      game: Game(
        homeTeam: teams[2],
        awayTeam: teams[3],
        league: "UEFA Champions League | 1/2 Finals",
        date: DateTime.now(),
      ),
      homeScore: 1,
      awayScore: 1,
      homePossetion: 54,
      awayPossetion: 46,
      homeShotsOnTarget: 4,
      awayShotsOnTarget: 5,
      homeShots: 25,
      awayShots: 18,
      homeFouls: 31,
      awayFouls: 68,
      homeCorners: 42,
      awayCorners: 57,
      homeCornerKicks: 11,
      awayCornerKicks: 7,
      homeOffsides: 12,
      awayOffsides: 3,
      homeYellowCards: 2,
      awayYellowCards: 3,
      homeRedCards: 1,
      awayRedCards: 1,
      homeFreeKicks: 12,
      awayFreeKicks: 14,
    ),
    MatchResult(
      game: Game(
        homeTeam: teams[0],
        awayTeam: teams[3],
        league: "UEFA Champions League | 1/2 Finals",
        date: DateTime.now().add(Duration(days: 2)),
      ),
      homeScore: 2,
      awayScore: 2,
      homePossetion: 54,
      awayPossetion: 46,
      homeShotsOnTarget: 4,
      awayShotsOnTarget: 5,
      homeShots: 25,
      awayShots: 18,
      homeFouls: 31,
      awayFouls: 68,
      homeCorners: 42,
      awayCorners: 57,
      homeCornerKicks: 11,
      awayCornerKicks: 7,
      homeOffsides: 12,
      awayOffsides: 3,
      homeYellowCards: 2,
      awayYellowCards: 3,
      homeRedCards: 1,
      awayRedCards: 1,
      homeFreeKicks: 12,
      awayFreeKicks: 14,
    ),
    MatchResult(
      game: Game(
          homeTeam: teams[1],
          awayTeam: teams[0],
          league: "UEFA Champions League | Final",
          date: DateTime.now().add(Duration(days: 1))),
      homeScore: 5,
      awayScore: 0,
      homePossetion: 54,
      awayPossetion: 46,
      homeShotsOnTarget: 4,
      awayShotsOnTarget: 5,
      homeShots: 25,
      awayShots: 18,
      homeFouls: 31,
      awayFouls: 68,
      homeCorners: 42,
      awayCorners: 57,
      homeCornerKicks: 11,
      awayCornerKicks: 7,
      homeOffsides: 12,
      awayOffsides: 3,
      homeYellowCards: 2,
      awayYellowCards: 3,
      homeRedCards: 1,
      awayRedCards: 1,
      homeFreeKicks: 12,
      awayFreeKicks: 14,
    ),
    MatchResult(
      game: Game(
          homeTeam: teams[2],
          awayTeam: teams[0],
          league: "UEFA Champions League | Final",
          date: DateTime.now().add(Duration(days: -1))),
      homeScore: 1,
      awayScore: 3,
      homePossetion: 54,
      awayPossetion: 46,
      homeShotsOnTarget: 4,
      awayShotsOnTarget: 5,
      homeShots: 25,
      awayShots: 18,
      homeFouls: 31,
      awayFouls: 68,
      homeCorners: 42,
      awayCorners: 57,
      homeCornerKicks: 11,
      awayCornerKicks: 7,
      homeOffsides: 12,
      awayOffsides: 3,
      homeYellowCards: 2,
      awayYellowCards: 3,
      homeRedCards: 1,
      awayRedCards: 1,
      homeFreeKicks: 12,
      awayFreeKicks: 14,
    ),
  ];

  static List<MatchResult> getMatchesByDate(DateTime date) {
    return matches.where((match) {
      return match.game.date.year == date.year &&
          match.game.date.month == date.month &&
          match.game.date.day == date.day;
    }).toList();
  }

  static List<MatchResult> getMatchesByTeam(Team homeTeam, Team awayTeam) {
    return matches.where((match) {
      return (match.game.homeTeam == homeTeam ||
              match.game.awayTeam == homeTeam ||
              match.game.homeTeam == awayTeam ||
              match.game.awayTeam == awayTeam) &&
          !(match.game.homeTeam == homeTeam &&
              match.game.awayTeam == awayTeam) &&
          match.game.date.isBefore(DateTime.now());
    }).toList();
  }

  static List<NewsModel> getAllNews() {
    List<NewsModel> news = [
      NewsModel(
        dateTime: DateTime.now(),
        imgUrl: ImageConstant.imgNews1,
        title:
            'Pep Guardiola named Premier League Manager of the Year after Man City win historic title',
        body:
            'Pep Guardiola has been crowned the Barclays Premier League Manager of the Year for the fifth time after leading Manchester City to a fourth successive title. The Spanish coach has retained the award he won last season and has now won it twice more than Jose Mourinho and Arsene Wenger, with only Sir Alex Ferguson ahead of him (11).\n\nGuardiola, who also won the award after his first three title wins with City, said: “It’s an honour to have been chosen by the Premier League as the Manager of the Season. “This award reflects the hard work and excellence of the people at the Club in all departments.\n\nI am so proud to be manager of this group of players and to work alongside the brilliant coaches and support staff every day. “Winning four titles in a row is one of the proudest achievements of my career.\n\nThis is the toughest league in the world and our competitors have played some incredible football.\n\n “When I arrived in England, I would never have thought that together we could win six Premier Leagues in seven years.\n\nWe have done something unbelievable and to celebrate that with our fans on Sunday was a day I will never forget.” Manchester City\'s director of football Txiki Begiristain said: "Everyone at City is delighted for Pep and this latest recognition of his achievements.\n\nAs Pep is always quick to point out, our history making success is a team effort and would not be possible without the tireless work of our players, coaches and backroom staff. “However, Pep’s inspirational leadership and drive to succeed has made us a beautiful team to watch and seen us once again come out on top in the toughest league in the world.\n\nHe has taken the Club to the summit of the game and everyone connected with Manchester City should be very proud that he represents us.” Join our new WhatsApp community and receive your daily dose of Mirror Football content.\n\nWe also treat our community members to special offers, promotions, and adverts from us and our partners.\n\nIf you don\'t like our community, you can check out any time you like.\n\nIf you\'re curious, you can read our Privacy Notice.',
        author: 'Desmond Kane',
      ),
      NewsModel(
        dateTime: DateTime.now(),
        imgUrl: ImageConstant.imgNews2,
        title:
            'Manchester City 3-1 West Ham – Phil Foden fires Pep Guardiola\'s side to historic fourth straight Premier League title',
        body:
            'With just a momentary setback, it was an otherwise perfect day for Manchester City as they defeated West Ham 3-1 to seal a quite incredible fourth successive Premier League title in front of their own fans at the Etihad Stadium.\n\nThere was briefly some anxiety for Pep Guardiola when the hosts\' lead was reduced to 2-1 after an early Phil Foden double, but Rodri made sure with a third on the hour.\n\nPhil Foden hit a glorious first-half double as Manchester City outclassed West Ham 3-1 on a frantic final day of the season to become the first club in history to claim four successive Premier League titles .\n\nAfter winning 2-0 at Tottenham on Tuesday, Pep Guardiola\'s side held a crucial two-point lead over Arsenal and knew a win at a sun-kissed Etihad on Sunday would see them wrap up a sixth English crown under the former Barcelona and Bayern Munich coach.\n\nEngland midfielder Foden showed why he was voted Premier League player of the season with two magical finishes (2\' and 18\') to ease the tension inside the opening 20 minutes.\n\nBut they could not find a rapid third goal despite swarming all over the visitors as Mohammed Kudus produced a stunning overhead kick (42\') to give the under-siege Hammers – who finished their season ninth in David Moyes\' final match as manager – unlikely hope.\n\nThat was quickly snuffed out when Rodri slammed the vital third into the net from 18 yards on 59 minutes to prompt wild scenes of celebration from Guardiola, his coaching staff and the home fans.\n\nThey win their latest title by two points with Mikel Arteta’s second-placed Arsenal finishing their own outstanding season with a 2-1 win over Everton at the Emirates.\n\nOnly former Manchester United manager Sir Alex Ferguson – 13 between 1993 and 2013 – has claimed more Premier League trophies than Guardiola at City.\n\nCity will bid to complete the traditional domestic double when they face rivals United in the FA Cup final at Wembley on Saturday a year after their 2-1 win over their city foes in the showpiece match.',
        author: 'Desmond Kane',
      ),
      NewsModel(
        dateTime: DateTime.now(),
        imgUrl: ImageConstant.imgNews3,
        title:
            'Cole Palmer and Chelsea team-mates immediately respond to Mauricio Pochettino exit',
        body:
            'Cole Palmer has paid tribute to former boss Mauricio Pochettino after the Chelsea head coach left the club via mutual consent.\n\nPochettino\'s departure from Stamford Bridge was confirmed on Tuesday, following discussions with sporting directors Paul Winstanley and Laurence Stewart.\n\nWhile Chelsea qualfied for European competition to end the season, the parties decided it was better to go their separate ways.\n\nPalmer, the Blues\' top goalscorer, has become the west London side\'s most important player under Pochettino after his transfer deadline day arrival in the summer.\n\nThe former Man City youngster was keen to show his appreciation to the departing coach.\n\nPalmer posted on Instagram : "Gaffer, thank you for everything you have done for me & making my dreams come true.\n\nAll the best." The 22-year-old, who was confirmed to be in Gareth Southgate\'s preliminary England squad for EURO 2024, was not alone in sharing his appreciation for Pochettino\'s efforts.\n\nNoni Madueke posted to his Instagram story: "Thank you," along with a picture of Pochettino placing an arm around him.\n\nChelsea defender Cucurella said: "Thank you for everything mister.\n\nGood luck in the future." Mykailho Mudryk utilised the same format to release the same message.\n\n"Thank you for everything," he said in addition to a picture of Pochettino talking into his here from the aftermath of the final day of the season.\n\nCucurella has now seen three permanent managers depart Chelsea in his two seasons at the club and had five different bosses.\n\nThomas Tuchel, Graham Potter, Bruno Saltor and Frank Lampard have all been in the hotseat in addition to Potter.\n\nPochettino\'s departure is said to have been amicable, and the former Blues boss believes the club is left in a good palce.\n\n"Thank you to the Chelsea ownership group and Sporting Directors for the opportunity to be part of this football club\'s history.\n\nThe Club is now well positioned to keep moving forward in the Premier League and Europe in the years to come," he said.\n\nFollowing the announcement of Pochettino\'s departure, sporting directors Stewart and Winstanley said: "On behalf of everyone at Chelsea, we would like to express our gratitude to Mauricio for his service this season.\n\nHe will be welcome back to Stamford Bridge any time and we wish him all the very best in his future coaching career."',
        author: 'Desmond Kane',
      ),
      NewsModel(
        dateTime: DateTime.now(),
        imgUrl: ImageConstant.imgNews4,
        title:
            'Arsenal 2-1 Everton: Gunners miss out on Premier League title to Man City despite late Kai Havertz winner',
        body:
            'Arsenal missed out on the Premier League title despite a 2-1 win over Everton on the final day of the season. The Gunners got the result they needed as they came from behind to beat the Toffees, with Kai Havertz netting a late winner. However, they were pipped to top spot by Manchester City, who ran out 3-1 victors against West Ham. Arsenal finish on 89 points, two behind City. A controversial last-minute winner from Kai Havertz secured victory for Arsenal over Everton, but it proved not enough to win them the title with Manchester City also victorious against West Ham. Referee Michael Oliver went to the sideline to view the ball striking Gabriel Jesus\' arm in the lead-up to Havertz\'s close-range strike but unusually, presumably because the arm was against the Brazilian\'s side, the goal was allowed to stand. Arsenal end the campaign on 89 points, two behind City on 91. Arsenal came into the match needing victory and hoping City failed to do so at home to West Ham, but within two minutes news of Phil Foden\'s goal at the Etihad showed this to be an even steeper uphill task than it began. The news of a second Manchester City goal vacuumed any positive mood in the stadium and, after Dominic Calvert-Lewin hit the post, Idrissa Gana Gueye\'s free-kick deflected in off Declan Rice in the wall six minutes before the break. The lead would only last a couple of minutes before Martin Odegaard pulled back from the by-line for Takehiro Tomiyasu to drive home. Havertz and Emile Smith Rowe both hit the bar in the second half from crosses from Gabriel Martinelli before the late drama.',
        author: 'Desmond Kane',
      ),
      NewsModel(
        dateTime: DateTime.now(),
        imgUrl: ImageConstant.imgNews5,
        title:
            'Jurgen Klopp pays tribute to Liverpool fans, \'the superpower of world football,\' in emotional farewell speech',
        body:
            'From the moment Jurgen Klopp had announced his intention to leave Liverpool at the end of the season, their final game of the campaign at Anfield against Wolverhampton Wanderers gained far greater significance. Speaking from the pitch, Klopp was serenaded by the club\'s fans, he paid tribute to them as a "superpower", and welcomed new manager Arne Slot with a song. Liverpool manager Jurgen Klopp told the club’s fans they are “the superpower of world football” in an emotional farewell speech. Klopp announced in January that he would leave Anfield at the end of the current season and with no European involvement after a UEFA Europa League defeat to Atalanta, the final game came on Sunday against Wolverhampton Wanderers. Liverpool claimed a routine 2-0 victory to take third place, but with nothing to play for the attention was on Klopp’s departure rather than the result. Klopp spoke to the fans from the pitch after he was serenaded by supporters, who are often regarded as some of the best in the world given their passion for their club. In the previous summer, Klopp had overhauled the side’s midfield, and with young players such as Conor Bradley coming through too, the German reflected that the club were on the cusp of a renewal. He said: "It doesn\'t feel like an end. It just feels like a start. Today I saw a football team play full of talent, youth, creativity, desire, greed. That\'s one part of development, that\'s what you need obviously.',
        author: 'Desmond Kane',
      ),
      NewsModel(
        dateTime: DateTime.now(),
        imgUrl: ImageConstant.imgNews6,
        title:
            'Toni Kroos to retire from football after Euro 2024 with Germany, Liga club Real Madrid confirm ',
        body:
            'Toni Kroos will retire from football after Euro 2024, it has been confirmed by Real Madrid. The World Cup winner will go down as one of the best midfielders of his generation, forming a legendary triumvirate with Luka Modric and Casemiro in the heart of the Real Madrid midfield as the Spanish champions dominated in Europe, winning four Champions League titles following the German\'s arrival in 2014 Legendary German midfielder Toni Kroos will retire at the end of Euro 2024, his club side Real Madrid have confirmed. Kroos, 34, began his career in the Bayern Munich youth team before eventually joining Real Madrid and playing a key part in their success over the past decade. Kroos has helped Madrid to win four La Liga titles, and four Champions Leagues as well as playing a starring role as Germany won the World Cup in 2014. However he will now step away from the sport entirely at the end of Euro 2024, where he has won a recall to the team under national team manager Julian Nagelsmann. A statement on the club website read as follows: "Real Madrid wants to express its gratitude and affection to Toni Kroos, a player who is already part of the history of Real Madrid and who is one of the great legends of our club and world football." Real Madrid president Florentino Pérez also added: "Toni Kroos is one of the great players in the history of Real Madrid and that this club is and will always be his home." Kroos also reacted to the news on Instagram, and thanked the Real Madrid fans for their unwavering support as Los Blancos target a record-extending 15th European title. He said: “July 17th, 2014 - the day of my presentation at Real Madrid, the day that changed my life. My life as a footballer - but especially as a person. It was the start of a new chapter at the biggest club in the world. After 10 years, at the end of the season this chapter comes to an end. “I will never forget that insolent successful time! I would particularly like to thank everyone that welcomed me with an open heart and trusted me. But especially I would like to thank you, dear Madridistas, for your affection and your love from the first day until the last one. “At the same time this decision means that my career as an active footballer will end this summer after the Euro championship. As I have always said: Real Madrid is and will be my last club. I am happy and proud, that in my mind I found the right timing for my decision and that I could choose it by my own. My ambition was always to finish my career at the peak of my performance level. From now on there is only one leading thought: a por la 15!!! HALA MADRID Y NADA MAS!#”',
        author: 'Desmond Kane',
      ),
    ];

    return news;
  }
}
