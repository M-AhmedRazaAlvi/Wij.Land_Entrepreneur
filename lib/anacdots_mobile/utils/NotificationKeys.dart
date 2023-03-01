import 'package:flutter/material.dart';

mixin PrefernceKey {
  static String report = "Report";
  static String anacdotSave = "Save";
  static String anacdotCancel = "Cancel";
  static String summary = "Summary Title";
  static String date = "Date";
  static String description = "Description";
  static String people = "People";
  static String userData = "userData";
  static String organization = "Organization";
  static String tags = "Tags";
  static String project = "Project";
  static String media = "Media";
  static String location = "Locations";

  static String tagHeading = "Tags";
  static String totalNotification = "totalNotification";
  static String dailyReports = "Daily Reports";
  static String myAnecdotes = "My Anecdotes";
  static String addNew = "New";
  static String showAll = "Show All";
}

mixin AppFont {
  static String heavyBold = "INTERBLACK";
  static String bold = "INTERBOLD";
  static String regular = "INTEREXTRABOLD";
  static String medium = "INTERMEDIUM";
  static String semiBold = "INTERSEMIBOLD";
  static String light = "INTERLIGHT";
}
mixin APPColor {
  static Color darkGreen = const Color(0xFF009966);
  static Color hoverGreen = const Color(0xFF009966).withOpacity(0.02);
  static Color lightGreen = const Color(0xFF009966).withOpacity(0.4);
  static Color anecBlack = const Color(0xFF171B28);
  static Color dateColor = const Color(0xFF3B4E68);
  static Color chipColor = const Color(0xFFDFF2EB);
}
