
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/game_service.dart';
import '../services/storage_service.dart';
import '../models/score.dart';
import '../widgets/timer_bar.dart';
import '../widgets/option_tile.dart';
import '../utils/colors.dart';
class GameScreen extends StatefulWidget {const GameScreen({super.key});@override State<GameScreen> createState()=>_GameScreenState();}
class _GameScreenState extends State<GameScreen> {
  final GameService _game=GameService();
  Question? _current;
  int _score=0,_streak=0,_bestStreak=0,_qIndex=0;
  final int _total=10;
  int _selected=-1;
  bool _revealed=false;
  Timer? _timer;
  double _progress=1.0;
  final int _seconds=15;
  @override void didChangeDependencies(){
    super.didChangeDependencies();
    final args=ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    final mode=args['mode'] as String?;
    final diffStr=args['difficulty'] as String?;
    QuestionType? type;
    if(mode=='guess') type=QuestionType.guessPlayer;
    if(mode=='whoScored') type=QuestionType.whoScored;
    if(mode=='history') type=QuestionType.history;
    if(mode=='derby') type=QuestionType.derby;
    if(mode=='pro') type=QuestionType.pro;
    Difficulty? diff;
    if(diffStr=='easy') diff=Difficulty.easy;
    if(diffStr=='medium') diff=Difficulty.medium;
    if(diffStr=='hard') diff=Difficulty.hard;
    _game.initGame(filterType:type,difficulty:diff);
    _next();
  }
  void _next(){
    if(_qIndex>=_total){_finish();return;}
    setState((){_current=_game.nextQuestion();_selected=-1;_revealed=false;_progress=1.0;_qIndex++;});
    if(_current==null){_finish();return;}
    _startTimer();
  }
  void _startTimer(){
    _timer?.cancel();
    int ticks=_seconds*10;int cur=ticks;
    _timer=Timer.periodic(const Duration(milliseconds:100),(t){cur--;if(!mounted) return;setState(()=>_progress=cur/ticks);if(cur<=0){t.cancel();_onTimeout();}});
  }
  void _onTimeout(){if(_revealed) return;setState((){_revealed=true;_streak=0;});Future.delayed(const Duration(seconds:1),_next);}
  void _select(int idx){
    if(_revealed||_current==null) return;
    _timer?.cancel();
    final correct=_game.checkAnswer(_current!,idx);
    setState((){_selected=idx;_revealed=true;if(correct){_score+=_current!.points+(_streak*5);_streak++;if(_streak>_bestStreak) _bestStreak=_streak;}else{_streak=0;}});
    Future.delayed(const Duration(milliseconds:1200),_next);
  }
  void _finish() async {
    _timer?.cancel();
    final gs=GameScore(score:_score,streak:_streak,bestStreak:_bestStreak,date:DateTime.now(),mode:'general');
    await StorageService().saveScore(gs);
    if(!mounted) return;
    Navigator.pushReplacementNamed(context,'/result',arguments:{'score':_score,'streak':_bestStreak,'total':_total});
  }
  @override void dispose(){_timer?.cancel();super.dispose();}
  @override Widget build(BuildContext context){
    if(_current==null) return const Scaffold(body:Center(child:CircularProgressIndicator()));
    return Scaffold(appBar:AppBar(title:Text('سؤال $_qIndex / $_total'),bottom:PreferredSize(preferredSize:Size.fromHeight(10),child:TimerBar(progress:_progress))),body:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
      Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Chip(label:Text('نقاط: $_score',style:TextStyle(color:Colors.white)),backgroundColor:AppColors.red),Chip(label:Text('سلسلة: $_streak 🔥'),backgroundColor:AppColors.black,labelStyle:TextStyle(color:Colors.white))]),
      const SizedBox(height:12),
      if(_current!.imageAsset!=null) ClipRRect(borderRadius:BorderRadius.circular(12),child:Image.asset(_current!.imageAsset!,height:160,fit:BoxFit.cover,errorBuilder:(c,e,s)=>Container(height:160,color:Colors.grey[200],child:Icon(Icons.image_not_supported)))),
      const SizedBox(height:12),
      Text(_current!.questionAr,style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold),textAlign:TextAlign.right),
      const SizedBox(height:4),
      Text(_current!.questionTn,style:TextStyle(color:Colors.grey[600]),textAlign:TextAlign.right),
      const SizedBox(height:8),
      if(_current!.hint1!=null&&!_revealed) Text('تلميح: ${_current!.hint1}',style:TextStyle(color:Colors.orange[800])),
      const SizedBox(height:12),
      ...List.generate(_current!.options.length,(i){bool? isCorrect;if(_revealed) isCorrect=i==_current!.correctIndex;return OptionTile(text:_current!.options[i],selected:_selected==i,correct:isCorrect,onTap:()=>_select(i));}),
      const Spacer(),
      if(_revealed) Text('المصدر: ${_current!.source} - ${_current!.date}',style:const TextStyle(fontSize:11,color:Colors.grey)),
    ])));
  }
}
