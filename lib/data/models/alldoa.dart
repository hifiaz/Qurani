import 'dart:convert';

AllDoa allDoaFromJson(String str) => AllDoa.fromJson(json.decode(str));

String allDoaToJson(AllDoa data) => json.encode(data.toJson());

class AllDoa {
  String title;
  String arabic;
  String latin;
  String translation;

  AllDoa({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  factory AllDoa.fromJson(Map<String, dynamic> json) => AllDoa(
        title: json["title"] == null ? null : json["title"],
        arabic: json["arabic"] == null ? null : json["arabic"],
        latin: json["latin"] == null ? null : json["latin"],
        translation: json["translation"] == null ? null : json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "arabic": arabic,
        "latin": latin,
        "translation": translation,
      };
}
