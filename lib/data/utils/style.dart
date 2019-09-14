import 'package:flutter/material.dart';

class AppStyle {
  static double ayahsize = 24.0;
  static final LinearGradient mainGradient = LinearGradient(colors: [
    Color(0xff338b93),
    Color(0xffb6f492),
  ]);
  static final title = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  static final subtitle = TextStyle(fontSize: 14.0, color: Colors.green);
  static final end2subtitle = TextStyle(
      fontSize: 12.0, color: Colors.grey[700], fontWeight: FontWeight.bold);

  static final spaceH5 = SizedBox(height: 5);
  static final spaceH10 = SizedBox(height: 10);
  static final ayah = TextStyle(fontSize: ayahsize, height: 1.5);
}
