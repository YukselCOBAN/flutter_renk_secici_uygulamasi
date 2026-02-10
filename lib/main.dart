import 'package:flutter/material.dart';
import 'package:flutter_renk_secici_uygulamasi/pages/color_picker_page.dart';
import 'package:flutter_renk_secici_uygulamasi/theme/app_theme.dart';

void main(List<String> args) {
  return runApp(RenkSeciciApp());
}

class RenkSeciciApp extends StatelessWidget {
  const RenkSeciciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: const ColorPickerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
