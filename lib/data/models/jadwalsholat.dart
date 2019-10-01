// To parse this JSON data, do
//
//     final jadwalDaily = jadwalDailyFromJson(jsonString);

import 'dart:convert';

JadwalDaily jadwalDailyFromJson(String str) => JadwalDaily.fromJson(json.decode(str));

String jadwalDailyToJson(JadwalDaily data) => json.encode(data.toJson());

class JadwalDaily {
    String title;
    String query;
    String jadwalDailyFor;
    int method;
    String prayerMethodName;
    String daylight;
    String timezone;
    String mapImage;
    String sealevel;
    TodayWeather todayWeather;
    String link;
    String qiblaDirection;
    String latitude;
    String longitude;
    String address;
    String city;
    String state;
    String postalCode;
    String country;
    String countryCode;
    List<Item> items;
    int statusValid;
    int statusCode;
    String statusDescription;

    JadwalDaily({
        this.title,
        this.query,
        this.jadwalDailyFor,
        this.method,
        this.prayerMethodName,
        this.daylight,
        this.timezone,
        this.mapImage,
        this.sealevel,
        this.todayWeather,
        this.link,
        this.qiblaDirection,
        this.latitude,
        this.longitude,
        this.address,
        this.city,
        this.state,
        this.postalCode,
        this.country,
        this.countryCode,
        this.items,
        this.statusValid,
        this.statusCode,
        this.statusDescription,
    });

    factory JadwalDaily.fromJson(Map<String, dynamic> json) => JadwalDaily(
        title: json["title"] == null ? null : json["title"],
        query: json["query"] == null ? null : json["query"],
        jadwalDailyFor: json["for"] == null ? null : json["for"],
        method: json["method"] == null ? null : json["method"],
        prayerMethodName: json["prayer_method_name"] == null ? null : json["prayer_method_name"],
        daylight: json["daylight"] == null ? null : json["daylight"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        mapImage: json["map_image"] == null ? null : json["map_image"],
        sealevel: json["sealevel"] == null ? null : json["sealevel"],
        todayWeather: json["today_weather"] == null ? null : TodayWeather.fromJson(json["today_weather"]),
        link: json["link"] == null ? null : json["link"],
        qiblaDirection: json["qibla_direction"] == null ? null : json["qibla_direction"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        address: json["address"] == null ? null : json["address"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        country: json["country"] == null ? null : json["country"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        statusValid: json["status_valid"] == null ? null : json["status_valid"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        statusDescription: json["status_description"] == null ? null : json["status_description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "query": query == null ? null : query,
        "for": jadwalDailyFor == null ? null : jadwalDailyFor,
        "method": method == null ? null : method,
        "prayer_method_name": prayerMethodName == null ? null : prayerMethodName,
        "daylight": daylight == null ? null : daylight,
        "timezone": timezone == null ? null : timezone,
        "map_image": mapImage == null ? null : mapImage,
        "sealevel": sealevel == null ? null : sealevel,
        "today_weather": todayWeather == null ? null : todayWeather.toJson(),
        "link": link == null ? null : link,
        "qibla_direction": qiblaDirection == null ? null : qiblaDirection,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "address": address == null ? null : address,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "postal_code": postalCode == null ? null : postalCode,
        "country": country == null ? null : country,
        "country_code": countryCode == null ? null : countryCode,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
        "status_valid": statusValid == null ? null : statusValid,
        "status_code": statusCode == null ? null : statusCode,
        "status_description": statusDescription == null ? null : statusDescription,
    };
}

class Item {
    String dateFor;
    String fajr;
    String shurooq;
    String dhuhr;
    String asr;
    String maghrib;
    String isha;

    Item({
        this.dateFor,
        this.fajr,
        this.shurooq,
        this.dhuhr,
        this.asr,
        this.maghrib,
        this.isha,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        dateFor: json["date_for"] == null ? null : json["date_for"],
        fajr: json["fajr"] == null ? null : json["fajr"],
        shurooq: json["shurooq"] == null ? null : json["shurooq"],
        dhuhr: json["dhuhr"] == null ? null : json["dhuhr"],
        asr: json["asr"] == null ? null : json["asr"],
        maghrib: json["maghrib"] == null ? null : json["maghrib"],
        isha: json["isha"] == null ? null : json["isha"],
    );

    Map<String, dynamic> toJson() => {
        "date_for": dateFor == null ? null : dateFor,
        "fajr": fajr == null ? null : fajr,
        "shurooq": shurooq == null ? null : shurooq,
        "dhuhr": dhuhr == null ? null : dhuhr,
        "asr": asr == null ? null : asr,
        "maghrib": maghrib == null ? null : maghrib,
        "isha": isha == null ? null : isha,
    };
}

class TodayWeather {
    String pressure;
    String temperature;

    TodayWeather({
        this.pressure,
        this.temperature,
    });

    factory TodayWeather.fromJson(Map<String, dynamic> json) => TodayWeather(
        pressure: json["pressure"] == null ? null : json["pressure"],
        temperature: json["temperature"] == null ? null : json["temperature"],
    );

    Map<String, dynamic> toJson() => {
        "pressure": pressure == null ? null : pressure,
        "temperature": temperature == null ? null : temperature,
    };
}
