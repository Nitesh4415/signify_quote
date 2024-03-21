import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';



abstract class AppTheme {
  static ThemeData getDefaultTheme() {
    return ThemeData(
      primaryColor: AppColors.mediumAquamarine,
      hintColor: AppColors.lightGrey,
      colorScheme: const ColorScheme.dark(
        background: Colors.black,
      ),
      // backgroundColor: AppColors.backgroundColor,
      canvasColor: AppColors.darkSlateGrey,
      iconTheme: const IconThemeData(color: AppColors.defaultIconColor),
      errorColor: AppColors.errorTextColor,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      primaryTextTheme: const TextTheme(
        bodyText2: AppTextStyles.bodyListTile,
        subtitle2: AppTextStyles.subtitleListTile,
        headline6: AppTextStyles.quoteText,
        headline5: AppTextStyles.quoteAuthor,
      ),
    );
  }
}
