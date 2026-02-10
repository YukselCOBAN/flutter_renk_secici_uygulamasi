import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    // static olduğu için hot Restart şart
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.tealAccent,
      elevation: 20, //appBar ile body arasındaki gölgelik
      iconTheme: IconThemeData(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
