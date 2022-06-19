import 'dart:convert';

AllAsmaul allAsmaulFromJson(String str) => AllAsmaul.fromJson(json.decode(str));

String allAsmaulToJson(AllAsmaul data) => json.encode(data.toJson());

class AllAsmaul {
  String index;
  String latin;
  String arabic;
  String translationId;
  String translationEn;

  AllAsmaul({
    required this.index,
    required this.latin,
    required this.arabic,
    required this.translationId,
    required this.translationEn,
  });

  factory AllAsmaul.fromJson(Map<String, dynamic> json) => AllAsmaul(
        index: json["index"] == null ? null : json["index"],
        latin: json["latin"] == null ? null : json["latin"],
        arabic: json["arabic"] == null ? null : json["arabic"],
        translationId:
            json["translation_id"] == null ? null : json["translation_id"],
        translationEn:
            json["translation_en"] == null ? null : json["translation_en"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "latin": latin,
        "arabic": arabic,
        "translation_id": translationId,
        "translation_en": translationEn,
      };
}
