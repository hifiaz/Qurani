import 'dart:convert';

AllAsmaul allAsmaulFromJson(String str) => AllAsmaul.fromJson(json.decode(str));

String allAsmaulToJson(AllAsmaul data) => json.encode(data.toJson());

class AllAsmaul {
    List<Datum> data;

    AllAsmaul({
        this.data,
    });

    factory AllAsmaul.fromJson(Map<String, dynamic> json) => AllAsmaul(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String index;
    String latin;
    String arabic;
    String translationId;
    String translationEn;

    Datum({
        this.index,
        this.latin,
        this.arabic,
        this.translationId,
        this.translationEn,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        index: json["index"] == null ? null : json["index"],
        latin: json["latin"] == null ? null : json["latin"],
        arabic: json["arabic"] == null ? null : json["arabic"],
        translationId: json["translation_id"] == null ? null : json["translation_id"],
        translationEn: json["translation_en"] == null ? null : json["translation_en"],
    );

    Map<String, dynamic> toJson() => {
        "index": index == null ? null : index,
        "latin": latin == null ? null : latin,
        "arabic": arabic == null ? null : arabic,
        "translation_id": translationId == null ? null : translationId,
        "translation_en": translationEn == null ? null : translationEn,
    };
}
