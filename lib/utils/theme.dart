
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';
ThemeData buildTheme() {
  final base=ThemeData(useMaterial3:true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(seedColor:AppColors.red,primary:AppColors.red,secondary:AppColors.black),
    textTheme: GoogleFonts.cairoTextTheme(base.textTheme),
    appBarTheme: const AppBarTheme(backgroundColor:AppColors.red,foregroundColor:AppColors.white,centerTitle:true),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor:AppColors.red,foregroundColor:AppColors.white,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),padding:const EdgeInsets.symmetric(vertical:14,horizontal:24))),
  );
}
