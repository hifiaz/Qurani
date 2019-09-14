import 'dart:convert';

AllDoa allDoaFromJson(String str) => AllDoa.fromJson(json.decode(str));

String allDoaToJson(AllDoa data) => json.encode(data.toJson());

class AllDoa {
    String title;
    String arabic;
    String latin;
    String translation;

    AllDoa({
        this.title,
        this.arabic,
        this.latin,
        this.translation,
    });

    factory AllDoa.fromJson(Map<String, dynamic> json) => AllDoa(
        title: json["title"] == null ? null : json["title"],
        arabic: json["arabic"] == null ? null : json["arabic"],
        latin: json["latin"] == null ? null : json["latin"],
        translation: json["translation"] == null ? null : json["translation"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "arabic": arabic == null ? null : arabic,
        "latin": latin == null ? null : latin,
        "translation": translation == null ? null : translation,
    };
}
