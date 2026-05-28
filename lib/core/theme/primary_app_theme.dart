import 'package:flutter/material.dart';
import 'package:newst_app/core/constant/app_colors.dart';

ThemeData primaryAppTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'times',
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.light,
  colorScheme: const ColorScheme.light(primaryContainer: Colors.white),
  iconTheme: const IconThemeData(color: Colors.black),
  //!  AppBar
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Color(0xff141414),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  //! ElevatedButton
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      textStyle: const TextStyle(fontSize: 16),
      fixedSize: const Size(double.infinity, 48),
    ),
  ),
  //! TextField
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color : Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white,),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
    ),
  ),
  //! Text Theme
  textTheme: const TextTheme(
    //?  title....
    titleSmall: TextStyle(
      fontSize: 10,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),

    //?  display
    displayMedium: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 11,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),

    //?  label
    labelMedium: TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      decoration: TextDecoration.lineThrough,
      decorationColor: Color.fromARGB(255, 59, 55, 55),
      decorationThickness: 5,
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    //? bpdy
    //!
    bodySmall: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    //!
    bodyMedium: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 28,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  ),
  //! Switch Theme
  switchTheme: SwitchThemeData(
    trackOutlineColor: WidgetStateProperty.all(Colors.grey),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return Colors.white;
      return Colors.grey;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return const Color(0xFF16b86d);
      return Colors.grey.shade300;
    }),
  ),
  //! Checkbox Theme
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Colors.white),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return AppColors.primaryColor;
      return null;
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(color: Colors.transparent, width: 2);
      }
      return BorderSide(width: 2, color: const Color(0xffd1dad7));
    }),
  ),
  //! FloatingActionButton Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF16b86d),
    foregroundColor: Colors.white,
    extendedTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  ),
  //! Bottom Navigation Bar Theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.light,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: Colors.black,
    showUnselectedLabels: true
  ),

  //! TextButton Theme
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
  ),

  // //! Splash Factory Theme
  splashFactory: NoSplash.splashFactory,
  // //! Icon Theme
  // primaryIconTheme: const IconThemeData(color: Colors.black),
  // //! popupMenu Theme
  // popupMenuTheme: PopupMenuThemeData(
  //   color: Colors.white,
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(16)),
  //     side: BorderSide(color: Colors.grey, width: 1),
  //   ),
  //   elevation: 10,
  //   labelTextStyle: WidgetStateProperty.all(
  //     const TextStyle(color: Colors.black, fontSize: 14),
  //   ),
  // ),
);
