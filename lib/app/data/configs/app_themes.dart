import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_restaurantapp/app/data/configs/app_configs.dart';

class AppThemes {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.backGroundColor,
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.primaryMaterialColor,
    fontFamily: GoogleFonts.roboto().fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
