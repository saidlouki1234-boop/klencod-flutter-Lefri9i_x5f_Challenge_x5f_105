
import 'package:flutter/material.dart';
import '../utils/colors.dart';
class TimerBar extends StatelessWidget {
  final double progress;
  const TimerBar({super.key,required this.progress});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius:BorderRadius.circular(8),child:LinearProgressIndicator(value:progress,minHeight:10,backgroundColor:Colors.grey[300],valueColor:AlwaysStoppedAnimation(progress<0.3?Colors.orange:AppColors.red)));
  }
}
