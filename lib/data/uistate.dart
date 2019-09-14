import 'package:flutter/material.dart';

class UiState with ChangeNotifier {
  static double ayahsize = 0.7;
  static double textsize = 0.4;
  static bool translate = false;
  static bool makna = false;

  set fontSize(newValue) {
    ayahsize = newValue;
    notifyListeners();
  }
  double get fontSize => ayahsize * 35;
  double get sliderFontSize => ayahsize;
  

  set fontSizetext(newValue) {
    textsize = newValue;
    notifyListeners();
  }
  double get fontSizetext => textsize * 35;
  double get sliderFontSizetext => textsize;

  set terjemahan(newValue) {
    translate = newValue;
    notifyListeners();
  }
  bool get terjemahan => translate;

  set tafsir(newValue){
    makna = newValue;
    notifyListeners();
  }
  bool get tafsir => makna;

}
