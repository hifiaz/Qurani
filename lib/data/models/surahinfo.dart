import 'dart:convert';

List<SurahInfo> surahInfoFromJson(String str) =>
    List<SurahInfo>.from(json.decode(str).map((x) => SurahInfo.fromJson(x)));

String surahInfoToJson(List<SurahInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurahInfo {
  String translation;
  String arabic;
  String latin;
  int ayahCount;
  int index;
  String opening;
  String closing;

  SurahInfo({
    required this.translation,
    required this.arabic,
    required this.latin,
    required this.ayahCount,
    required this.index,
    required this.opening,
    required this.closing,
  });

  factory SurahInfo.fromJson(Map<String, dynamic> json) => SurahInfo(
        translation: json["translation"] == null ? null : json["translation"],
        arabic: json["arabic"] == null ? null : json["arabic"],
        latin: json["latin"] == null ? null : json["latin"],
        ayahCount: json["ayah_count"] == null ? null : json["ayah_count"],
        index: json["index"] == null ? null : json["index"],
        opening: json["opening"] == null ? null : json["opening"],
        closing: json["closing"] == null ? null : json["closing"],
      );

  Map<String, dynamic> toJson() => {
        "translation": translation,
        "arabic": arabic,
        "latin": latin,
        "ayah_count": ayahCount,
        "index": index,
        "opening": opening,
        "closing": closing,
      };
}
