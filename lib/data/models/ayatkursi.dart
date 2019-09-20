import 'dart:convert';

AyathKursi ayathKursiFromJson(String str) => AyathKursi.fromJson(json.decode(str));

String ayathKursiToJson(AyathKursi data) => json.encode(data.toJson());

class AyathKursi {
    String tafsir;
    String translation;
    String arabic;
    String latin;

    AyathKursi({
        this.tafsir,
        this.translation,
        this.arabic,
        this.latin,
    });

    factory AyathKursi.fromJson(Map<String, dynamic> json) => AyathKursi(
        tafsir: json["tafsir"] == null ? null : json["tafsir"],
        translation: json["translation"] == null ? null : json["translation"],
        arabic: json["arabic"] == null ? null : json["arabic"],
        latin: json["latin"] == null ? null : json["latin"],
    );

    Map<String, dynamic> toJson() => {
        "tafsir": tafsir == null ? null : tafsir,
        "translation": translation == null ? null : translation,
        "arabic": arabic == null ? null : arabic,
        "latin": latin == null ? null : latin,
    };
}
