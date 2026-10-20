
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../services/storage_service.dart';
class HomeScreen extends StatefulWidget {const HomeScreen({super.key});@override State<HomeScreen> createState()=>_HomeScreenState();}
class _HomeScreenState extends State<HomeScreen> {
  int best=0;
  @override void initState(){super.initState();StorageService().getBest().then((v)=>setState(()=>best=v));}
  @override Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(title:const Text('تحدي الإفريقي 105'),actions:[Padding(padding:EdgeInsets.symmetric(horizontal:12),child:Center(child:Text('أفضل: $best',style:TextStyle(fontWeight:FontWeight.bold))))]),body:ListView(padding:const EdgeInsets.all(16),children:[
      Container(padding:const EdgeInsets.all(16),decoration:BoxDecoration(gradient:LinearGradient(colors:[AppColors.red,AppColors.darkRed]),borderRadius:BorderRadius.circular(16)),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('أهلا بيك يا إفريقي! 🇹🇳',style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.bold)),SizedBox(height:6),Text('اختار التحدي وورينا قداش تعرف الإفريقي',style:TextStyle(color:Colors.white70))])),
      const SizedBox(height:16),
      _card(context,'طلّع اللاعب','اعرف اللاعب من الصورة والتلميحات',Icons.person_search,'/game',{'mode':'guess'}),
      _card(context,'شكون سجّل الهدف؟','مباريات حقيقية بمصادر موثقة',Icons.sports_soccer,'/game',{'mode':'whoScored'}),
      _card(context,'تاريخ الإفريقي','أسئلة الألقاب والذكريات',Icons.history_edu,'/game',{'mode':'history'}),
      _card(context,'تحدي الدربي','دربي العاصمة 🔥',Icons.local_fire_department,'/game',{'mode':'derby'}),
      _card(context,'تحدي المحترفين','أسئلة صعبة للمكشخين الصحاح',Icons.emoji_events,'/game',{'mode':'pro'}),
      const SizedBox(height:12),
      Row(children:[Expanded(child:ElevatedButton(onPressed:()=>Navigator.pushNamed(context,'/game',arguments:{'difficulty':'easy'}),child:Text('سهل'))),SizedBox(width:8),Expanded(child:ElevatedButton(onPressed:()=>Navigator.pushNamed(context,'/game',arguments:{'difficulty':'medium'}),child:Text('متوسط'))),SizedBox(width:8),Expanded(child:ElevatedButton(onPressed:()=>Navigator.pushNamed(context,'/game',arguments:{'difficulty':'hard'}),style:ElevatedButton.styleFrom(backgroundColor:AppColors.black),child:Text('صعب')))]),
      const SizedBox(height:12),
      OutlinedButton.icon(onPressed:()=>Navigator.pushNamed(context,'/leaderboard'),icon:Icon(Icons.leaderboard),label:Text('سجل النتائج')),
    ]));
  }
  Widget _card(BuildContext c,String title,String sub,IconData icon,String route,Map args){return Card(margin:EdgeInsets.symmetric(vertical:6),child:ListTile(leading:CircleAvatar(backgroundColor:AppColors.red,child:Icon(icon,color:Colors.white)),title:Text(title,style:TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(sub),trailing:Icon(Icons.arrow_forward_ios,size:16),onTap:()=>Navigator.pushNamed(c,route,arguments:args)));}
}
