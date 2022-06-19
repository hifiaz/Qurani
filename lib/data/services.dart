import 'dart:convert';

import 'package:alqurani/data/models/allasmaul.dart';
import 'package:alqurani/data/models/alldoa.dart';
import 'package:alqurani/data/models/allsurah.dart';
import 'package:alqurani/data/models/ayatkursi.dart';
import 'package:alqurani/data/models/surahinfo.dart';
import 'package:flutter/services.dart';

class ServiceData {
  var infosurah = 'assets/surah/surah-info.json';
  var listdoa = 'assets/surah/doa-harian.json';
  var listasmaulhusna = 'assets/surah/asmaul-husna.json';
  var ayatkursi = 'assets/surah/ayat-kursi.json';

  Future<List<SurahInfo>> loadInfo() async {
    var response = await rootBundle.loadString(infosurah);
    Iterable data = json.decode(response);
    return data.map((model) => SurahInfo.fromJson(model)).toList();
  }

  Future<AllSurah> loadSurah(int number) async {
    final response = await rootBundle.loadString('assets/surah/$number.json');
    var res = json.decode(response);
    var data = res['$number'];
    return AllSurah.fromJson(data);
  }

  Future<List<AllDoa>> loadDoa() async {
    var response = await rootBundle.loadString(listdoa);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllDoa.fromJson(model)).toList();
  }

  Future<List<AllAsmaul>> loadAsmaul() async {
    var response = await rootBundle.loadString(listasmaulhusna);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllAsmaul.fromJson(model)).toList();
  }

  Future<AyathKursi> loadAyatKursi() async {
    var response = await rootBundle.loadString(ayatkursi);
    var res = json.decode(response);
    var data = res['data'];
    return AyathKursi.fromJson(data);
  }
}
