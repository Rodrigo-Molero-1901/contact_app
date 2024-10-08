import 'package:flutter/material.dart';

abstract class _AppColors {
  static const black = Colors.black;
  static const white = Colors.white;
  static const deepPurpleAccent = Colors.deepPurpleAccent;
  static const greenAccent = Colors.greenAccent;
  static const lightBlueAccent = Colors.lightBlueAccent;
  static const grey = Colors.grey;
  static const nero = Color(0xFF171717);
}

abstract class AppContextColors {
  // Home
  static const homeBackground = _AppColors.black;

  // Contact group row
  static const contactRow = _AppColors.nero;
  static const contactRowAvatar = _AppColors.deepPurpleAccent;
  static const slidableForeground = _AppColors.white;
  static const call = _AppColors.greenAccent;
  static const sms = _AppColors.lightBlueAccent;

  // Contact info
  static const contactInfoBackground = _AppColors.black;
  static const contactCardBackground = _AppColors.nero;
  static const contactAvatar = _AppColors.deepPurpleAccent;
  static const addressLabel = _AppColors.grey;
  static const contactInfoRowBackground = _AppColors.nero;
  static const emptyInfoField = _AppColors.grey;

  /// Contact info action buttons
  static const actionCall = _AppColors.greenAccent;
  static const actionSms = _AppColors.lightBlueAccent;
  static const actionEmail = _AppColors.grey;

  // Edit contact
  static const editRowBackground = _AppColors.nero;
}
