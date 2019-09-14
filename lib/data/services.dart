import 'dart:convert';

import 'package:alqurani/data/models/alldoa.dart';
import 'package:alqurani/data/models/allsurah.dart';
import 'package:alqurani/data/models/surahinfo.dart';
import 'package:flutter/services.dart';

class ServiceData {
  var infosurah = 'surah/surah-info.json';
  var listdoa = 'surah/doa-harian.json';

  Future<List<SurahInfo>> loadInfo() async {
    var response = await rootBundle.loadString(infosurah);
    Iterable data = json.decode(response);
    return data.map((model) => SurahInfo.fromJson(model)).toList();
  }

  Future<AllSurah> loadSurah(int number) async {
    final response = await rootBundle.loadString('surah/$number.json');
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
}
