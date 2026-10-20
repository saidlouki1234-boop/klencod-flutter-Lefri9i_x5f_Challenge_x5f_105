
import 'package:flutter/material.dart';
import '../utils/colors.dart';
class OptionTile extends StatelessWidget {
  final String text; final bool selected; final bool? correct; final VoidCallback onTap;
  const OptionTile({super.key,required this.text,required this.selected,this.correct,required this.onTap});
  @override
  Widget build(BuildContext context) {
    Color bg=Colors.white;
    if(correct==true) bg=Colors.green.shade100;
    if(correct==false&&selected) bg=Colors.red.shade100;
    return InkWell(onTap:onTap,child:Container(margin:const EdgeInsets.symmetric(vertical:6),padding:const EdgeInsets.all(14),decoration:BoxDecoration(color:bg,borderRadius:BorderRadius.circular(12),border:Border.all(color:selected?AppColors.red:Colors.grey.shade300,width:selected?2:1)),child:Row(children:[Expanded(child:Text(text,style:const TextStyle(fontSize:16,fontWeight:FontWeight.w600))),if(selected) const Icon(Icons.check_circle,color:AppColors.red)])));
  }
}
