
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/score.dart';
class StorageService {
  static const _keyScores='scores_v1';
  static const _keyBest='best_score_v1';
  Future<List<GameScore>> getScores() async {
    final prefs=await SharedPreferences.getInstance();
    final s=prefs.getString(_keyScores);
    if(s==null) return [];
    final List list=jsonDecode(s);
    return list.map((e)=>GameScore.fromJson(e)).toList();
  }
  Future<void> saveScore(GameScore s) async {
    final prefs=await SharedPreferences.getInstance();
    final scores=await getScores();
    scores.add(s);
    scores.sort((a,b)=>b.score.compareTo(a.score));
    await prefs.setString(_keyScores, jsonEncode(scores.take(50).map((e)=>e.toJson()).toList()));
    final best=prefs.getInt(_keyBest)??0;
    if(s.score>best) await prefs.setInt(_keyBest, s.score);
  }
  Future<int> getBest() async {
    final prefs=await SharedPreferences.getInstance();
    return prefs.getInt(_keyBest)??0;
  }
}
