
class GameScore {
  final int score; final int streak; final int bestStreak; final DateTime date; final String mode;
  GameScore({required this.score, required this.streak, required this.bestStreak, required this.date, required this.mode});
  Map<String,dynamic> toJson() => {'score':score,'streak':streak,'bestStreak':bestStreak,'date':date.toIso8601String(),'mode':mode};
  factory GameScore.fromJson(Map<String,dynamic> j) => GameScore(score:j['score'],streak:j['streak'],bestStreak:j['bestStreak'],date:DateTime.parse(j['date']),mode:j['mode']);
}
