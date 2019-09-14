// To parse this JSON data, do
//
//     final allSurah = allSurahFromJson(jsonString);

import 'dart:convert';

List<Map<String, AllSurah>> allSurahFromJson(String str) => List<Map<String, AllSurah>>.from(json.decode(str).map((x) => Map.from(x).map((k, v) => MapEntry<String, AllSurah>(k, AllSurah.fromJson(v)))));

String allSurahToJson(List<Map<String, AllSurah>> data) => json.encode(List<dynamic>.from(data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))));

class AllSurah {
    String number;
    String name;
    String nameLatin;
    String numberOfAyah;
    Map<String, String> text;
    Translations translations;
    Tafsir tafsir;

    AllSurah({
        this.number,
        this.name,
        this.nameLatin,
        this.numberOfAyah,
        this.text,
        this.translations,
        this.tafsir,
    });

    factory AllSurah.fromJson(Map<String, dynamic> json) => AllSurah(
        number: json["number"] == null ? null : json["number"],
        name: json["name"] == null ? null : json["name"],
        nameLatin: json["name_latin"] == null ? null : json["name_latin"],
        numberOfAyah: json["number_of_ayah"] == null ? null : json["number_of_ayah"],
        text: json["text"] == null ? null : Map.from(json["text"]).map((k, v) => MapEntry<String, String>(k, v)),
        translations: json["translations"] == null ? null : Translations.fromJson(json["translations"]),
        tafsir: json["tafsir"] == null ? null : Tafsir.fromJson(json["tafsir"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "name": name == null ? null : name,
        "name_latin": nameLatin == null ? null : nameLatin,
        "number_of_ayah": numberOfAyah == null ? null : numberOfAyah,
        "text": text == null ? null : Map.from(text).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": translations == null ? null : translations.toJson(),
        "tafsir": tafsir == null ? null : tafsir.toJson(),
    };
}

class Tafsir {
    TafsirId id;

    Tafsir({
        this.id,
    });

    factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"] == null ? null : TafsirId.fromJson(json["id"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id.toJson(),
    };
}

class TafsirId {
    Kemenag kemenag;

    TafsirId({
        this.kemenag,
    });

    factory TafsirId.fromJson(Map<String, dynamic> json) => TafsirId(
        kemenag: json["kemenag"] == null ? null : Kemenag.fromJson(json["kemenag"]),
    );

    Map<String, dynamic> toJson() => {
        "kemenag": kemenag == null ? null : kemenag.toJson(),
    };
}

class Kemenag {
    String name;
    String source;
    Map<String, String> text;

    Kemenag({
        this.name,
        this.source,
        this.text,
    });

    factory Kemenag.fromJson(Map<String, dynamic> json) => Kemenag(
        name: json["name"] == null ? null : json["name"],
        source: json["source"] == null ? null : json["source"],
        text: json["text"] == null ? null : Map.from(json["text"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "source": source == null ? null : source,
        "text": text == null ? null : Map.from(text).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Translations {
    TranslationsId id;

    Translations({
        this.id,
    });

    factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        id: json["id"] == null ? null : TranslationsId.fromJson(json["id"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id.toJson(),
    };
}

class TranslationsId {
    String name;
    Map<String, String> text;

    TranslationsId({
        this.name,
        this.text,
    });

    factory TranslationsId.fromJson(Map<String, dynamic> json) => TranslationsId(
        name: json["name"] == null ? null : json["name"],
        text: json["text"] == null ? null : Map.from(json["text"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "text": text == null ? null : Map.from(text).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
