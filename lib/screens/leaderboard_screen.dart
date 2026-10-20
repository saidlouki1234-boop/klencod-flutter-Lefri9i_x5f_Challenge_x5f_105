
import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/score.dart';
class LeaderboardScreen extends StatefulWidget {const LeaderboardScreen({super.key});@override State<LeaderboardScreen> createState()=>_LeaderboardScreenState();}
class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<GameScore> scores=[];
  @override void initState(){super.initState();StorageService().getScores().then((v)=>setState(()=>scores=v));}
  @override Widget build(BuildContext context){return Scaffold(appBar:AppBar(title:Text('سجل النتائج')),body:scores.isEmpty?Center(child:Text('ما زال ما لعبتش حتى جولة')):ListView.builder(itemCount:scores.length,itemBuilder:(c,i){final s=scores[i];return ListTile(leading:CircleAvatar(child:Text('${i+1}')),title:Text('${s.score} نقطة'),subtitle:Text('${s.mode} - ${s.date.toLocal().toString().split(' ')[0]} - سلسلة ${s.bestStreak}'),trailing:Icon(i==0?Icons.emoji_events:null,color:Colors.amber));}));}
}
