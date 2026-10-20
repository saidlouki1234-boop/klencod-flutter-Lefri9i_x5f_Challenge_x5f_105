
import 'package:flutter_test/flutter_test.dart';
import 'package:lefri9i_challenge_105/services/game_service.dart';
import 'package:lefri9i_challenge_105/models/question.dart';
void main(){
  test('no repeat',(){final s=GameService();s.initGame();final q1=s.nextQuestion();final q2=s.nextQuestion();expect(q1!=null,true);expect(q1!.id!=q2!.id,true);});
  test('check answer',(){final s=GameService();const q=Question(id:'t',type:QuestionType.history,difficulty:Difficulty.easy,questionAr:'سؤال',questionTn:'سؤال',options:['a','b'],correctIndex:0,source:'test',date:'2024-01-01');expect(s.checkAnswer(q,0),true);expect(s.checkAnswer(q,1),false);});
}
