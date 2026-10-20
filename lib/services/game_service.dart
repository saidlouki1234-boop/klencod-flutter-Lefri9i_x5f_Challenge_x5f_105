
import 'dart:math';
import '../models/question.dart';
import '../data/questions_data.dart';
class GameService {
  final Random _rnd=Random();
  List<Question> _pool=[];
  final List<Question> _used=[];
  void initGame({QuestionType? filterType, Difficulty? difficulty}) {
    _pool=List.from(initialQuestions);
    if(filterType!=null) _pool=_pool.where((q)=>q.type==filterType).toList();
    if(difficulty!=null) _pool=_pool.where((q)=>q.difficulty==difficulty).toList();
    if(_pool.isEmpty) _pool=List.from(initialQuestions);
    _pool.shuffle(_rnd);
    _used.clear();
  }
  Question? nextQuestion() {
    final available=_pool.where((q)=>!_used.contains(q)).toList();
    if(available.isEmpty) return null;
    final q=available[_rnd.nextInt(available.length)];
    _used.add(q);
    return q;
  }
  bool checkAnswer(Question q,int selected)=>q.correctIndex==selected;
}
