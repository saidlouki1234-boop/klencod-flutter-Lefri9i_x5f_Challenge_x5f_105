
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'package:confetti/confetti.dart';
class ResultScreen extends StatefulWidget {const ResultScreen({super.key});@override State<ResultScreen> createState()=>_ResultScreenState();}
class _ResultScreenState extends State<ResultScreen> {
  late ConfettiController _confetti;
  @override void initState(){super.initState();_confetti=ConfettiController(duration:Duration(seconds:2));_confetti.play();}
  @override void dispose(){_confetti.dispose();super.dispose();}
  @override Widget build(BuildContext context){
    final args=ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    final score=args['score']??0;final streak=args['streak']??0;
    return Scaffold(body:Stack(children:[Center(child:Padding(padding:const EdgeInsets.all(24),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[const Text('برافو! 🎉',style:TextStyle(fontSize:32,fontWeight:FontWeight.bold)),const SizedBox(height:12),Text('جبت $score نقطة',style:TextStyle(fontSize:24,fontWeight:FontWeight.w600)),Text('أحسن سلسلة: $streak',style:TextStyle(fontSize:18)),const SizedBox(height:24),if(score>=80) const Text('إفريقي أصيل ❤️🤍',style:TextStyle(fontSize:20,color:AppColors.red,fontWeight:FontWeight.bold)),const SizedBox(height:24),ElevatedButton.icon(onPressed:()=>Navigator.pushReplacementNamed(context,'/game'),icon:Icon(Icons.replay),label:Text('إعادة اللعب')),const SizedBox(height:8),OutlinedButton(onPressed:()=>Navigator.pushReplacementNamed(context,'/home'),child:Text('القائمة الرئيسية'))]))),Align(alignment:Alignment.topCenter,child:ConfettiWidget(confettiController:_confetti,blastDirectionality:BlastDirectionality.explosive,colors:[AppColors.red,AppColors.white,AppColors.black,AppColors.gold]))]));
  }
}
