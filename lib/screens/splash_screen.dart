
import 'package:flutter/material.dart';
import '../utils/colors.dart';
class SplashScreen extends StatefulWidget {const SplashScreen({super.key});@override State<SplashScreen> createState()=>_SplashScreenState();}
class _SplashScreenState extends State<SplashScreen> {
  @override void initState(){super.initState();Future.delayed(const Duration(seconds:2),(){if(mounted) Navigator.pushReplacementNamed(context,'/home');});}
  @override Widget build(BuildContext context){return Scaffold(backgroundColor:AppColors.red,body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Container(width:120,height:120,decoration:BoxDecoration(color:Colors.white,shape:BoxShape.circle,border:Border.all(color:AppColors.black,width:4)),child:const Center(child:Text('105',style:TextStyle(fontSize:48,fontWeight:FontWeight.w900,color:AppColors.red)))),const SizedBox(height:20),const Text('LEFRI9I CHALLENGE',style:TextStyle(color:Colors.white,fontSize:26,fontWeight:FontWeight.bold)),const Text('تحدي الإفريقي',style:TextStyle(color:Colors.white,fontSize:20)),const SizedBox(height:10),const Text('من 1920 والمجد مستمر',style:TextStyle(color:Colors.white70))])));}
}
