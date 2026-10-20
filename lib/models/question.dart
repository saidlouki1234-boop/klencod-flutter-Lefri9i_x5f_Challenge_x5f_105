
enum QuestionType { guessPlayer, whoScored, history, derby, pro }
enum Difficulty { easy, medium, hard }
class Question {
  final String id;
  final QuestionType type;
  final Difficulty difficulty;
  final String questionAr;
  final String questionTn;
  final List<String> options;
  final int correctIndex;
  final String? imageAsset;
  final String? hint1;
  final String? hint2;
  final String source;
  final String date;
  final int points;
  const Question({required this.id, required this.type, required this.difficulty, required this.questionAr, required this.questionTn, required this.options, required this.correctIndex, this.imageAsset, this.hint1, this.hint2, required this.source, required this.date, this.points=10});
}
