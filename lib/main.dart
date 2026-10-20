
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/theme.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/game_screen.dart';
import 'screens/result_screen.dart';
import 'screens/leaderboard_screen.dart';
void main() async {WidgetsFlutterBinding.ensureInitialized();runApp(const Lefri9iApp());}
class Lefri9iApp extends StatelessWidget {const Lefri9iApp({super.key});@override Widget build(BuildContext context){return MaterialApp(title:'Lefri9i Challenge 105',debugShowCheckedModeBanner:false,theme:buildTheme(),locale:const Locale('ar'),supportedLocales:const [Locale('ar'),Locale('fr'),Locale('en')],localizationsDelegates:const [GlobalMaterialLocalizations.delegate,GlobalWidgetsLocalizations.delegate,GlobalCupertinoLocalizations.delegate],initialRoute:'/',routes:{'/':(c)=>const SplashScreen(),'/home':(c)=>const HomeScreen(),'/game':(c)=>const GameScreen(),'/result':(c)=>const ResultScreen(),'/leaderboard':(c)=>const LeaderboardScreen()});}}