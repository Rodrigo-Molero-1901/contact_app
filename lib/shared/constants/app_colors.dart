import 'package:flutter/material.dart';

abstract class _AppColors {
  static const black = Colors.black;
  static const white = Colors.white;
  static const deepPurpleAccent = Colors.deepPurpleAccent;
  static const greenAccent = Colors.greenAccent;
  static const lightBlueAccent = Colors.lightBlueAccent;
  static const nero = Color(0xFF171717);
}

abstract class AppContextColors {
  // Home
  static const homeBackground = _AppColors.black;

  // Contact group row
  static const contactRow = _AppColors.nero;
  static const contactRowAvatar = _AppColors.deepPurpleAccent;
  static const call = _AppColors.greenAccent;
  static const sms = _AppColors.lightBlueAccent;

  // Contact info
  static const contactInfoBackground = _AppColors.black;
  static const infoRow = _AppColors.nero;
}
