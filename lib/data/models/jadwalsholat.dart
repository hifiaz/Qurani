// To parse this JSON data, do
//
//     final jadwalDaily = jadwalDailyFromJson(jsonString);

import 'dart:convert';

JadwalDaily jadwalDailyFromJson(String str) => JadwalDaily.fromJson(json.decode(str));

String jadwalDailyToJson(JadwalDaily data) => json.encode(data.toJson());

class JadwalDaily {
    JadwalDaily({
        this.code,
        this.status,
        this.results,
    });

    int code;
    String status;
    Results results;

    factory JadwalDaily.fromJson(Map<String, dynamic> json) => JadwalDaily(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        results: json["results"] == null ? null : Results.fromJson(json["results"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "results": results == null ? null : results.toJson(),
    };
}

class Results {
    Results({
        this.datetime,
        this.location,
        this.settings,
    });

    List<Datetime> datetime;
    Location location;
    Settings settings;

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        datetime: json["datetime"] == null ? null : List<Datetime>.from(json["datetime"].map((x) => Datetime.fromJson(x))),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        settings: json["settings"] == null ? null : Settings.fromJson(json["settings"]),
    );

    Map<String, dynamic> toJson() => {
        "datetime": datetime == null ? null : List<dynamic>.from(datetime.map((x) => x.toJson())),
        "location": location == null ? null : location.toJson(),
        "settings": settings == null ? null : settings.toJson(),
    };
}

class Datetime {
    Datetime({
        this.times,
        this.date,
    });

    Times times;
    Date date;

    factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
        times: json["times"] == null ? null : Times.fromJson(json["times"]),
        date: json["date"] == null ? null : Date.fromJson(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "times": times == null ? null : times.toJson(),
        "date": date == null ? null : date.toJson(),
    };
}

class Date {
    Date({
        this.timestamp,
        this.gregorian,
        this.hijri,
    });

    int timestamp;
    DateTime gregorian;
    DateTime hijri;

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        gregorian: json["gregorian"] == null ? null : DateTime.parse(json["gregorian"]),
        hijri: json["hijri"] == null ? null : DateTime.parse(json["hijri"]),
    );

    Map<String, dynamic> toJson() => {
        "timestamp": timestamp == null ? null : timestamp,
        "gregorian": gregorian == null ? null : "${gregorian.year.toString().padLeft(4, '0')}-${gregorian.month.toString().padLeft(2, '0')}-${gregorian.day.toString().padLeft(2, '0')}",
        "hijri": hijri == null ? null : "${hijri.year.toString().padLeft(4, '0')}-${hijri.month.toString().padLeft(2, '0')}-${hijri.day.toString().padLeft(2, '0')}",
    };
}

class Times {
    Times({
        this.imsak,
        this.sunrise,
        this.fajr,
        this.dhuhr,
        this.asr,
        this.sunset,
        this.maghrib,
        this.isha,
        this.midnight,
    });

    String imsak;
    String sunrise;
    String fajr;
    String dhuhr;
    String asr;
    String sunset;
    String maghrib;
    String isha;
    String midnight;

    factory Times.fromJson(Map<String, dynamic> json) => Times(
        imsak: json["Imsak"] == null ? null : json["Imsak"],
        sunrise: json["Sunrise"] == null ? null : json["Sunrise"],
        fajr: json["Fajr"] == null ? null : json["Fajr"],
        dhuhr: json["Dhuhr"] == null ? null : json["Dhuhr"],
        asr: json["Asr"] == null ? null : json["Asr"],
        sunset: json["Sunset"] == null ? null : json["Sunset"],
        maghrib: json["Maghrib"] == null ? null : json["Maghrib"],
        isha: json["Isha"] == null ? null : json["Isha"],
        midnight: json["Midnight"] == null ? null : json["Midnight"],
    );

    Map<String, dynamic> toJson() => {
        "Imsak": imsak == null ? null : imsak,
        "Sunrise": sunrise == null ? null : sunrise,
        "Fajr": fajr == null ? null : fajr,
        "Dhuhr": dhuhr == null ? null : dhuhr,
        "Asr": asr == null ? null : asr,
        "Sunset": sunset == null ? null : sunset,
        "Maghrib": maghrib == null ? null : maghrib,
        "Isha": isha == null ? null : isha,
        "Midnight": midnight == null ? null : midnight,
    };
}

class Location {
    Location({
        this.latitude,
        this.longitude,
        this.elevation,
        this.city,
        this.country,
        this.countryCode,
        this.timezone,
        this.localOffset,
    });

    double latitude;
    double longitude;
    double elevation;
    String city;
    String country;
    String countryCode;
    String timezone;
    double localOffset;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        elevation: json["elevation"] == null ? null : json["elevation"],
        city: json["city"] == null ? null : json["city"],
        country: json["country"] == null ? null : json["country"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        localOffset: json["local_offset"] == null ? null : json["local_offset"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "elevation": elevation == null ? null : elevation,
        "city": city == null ? null : city,
        "country": country == null ? null : country,
        "country_code": countryCode == null ? null : countryCode,
        "timezone": timezone == null ? null : timezone,
        "local_offset": localOffset == null ? null : localOffset,
    };
}

class Settings {
    Settings({
        this.timeformat,
        this.school,
        this.juristic,
        this.highlat,
        this.fajrAngle,
        this.ishaAngle,
    });

    String timeformat;
    String school;
    String juristic;
    String highlat;
    double fajrAngle;
    double ishaAngle;

    factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        timeformat: json["timeformat"] == null ? null : json["timeformat"],
        school: json["school"] == null ? null : json["school"],
        juristic: json["juristic"] == null ? null : json["juristic"],
        highlat: json["highlat"] == null ? null : json["highlat"],
        fajrAngle: json["fajr_angle"] == null ? null : json["fajr_angle"],
        ishaAngle: json["isha_angle"] == null ? null : json["isha_angle"],
    );

    Map<String, dynamic> toJson() => {
        "timeformat": timeformat == null ? null : timeformat,
        "school": school == null ? null : school,
        "juristic": juristic == null ? null : juristic,
        "highlat": highlat == null ? null : highlat,
        "fajr_angle": fajrAngle == null ? null : fajrAngle,
        "isha_angle": ishaAngle == null ? null : ishaAngle,
    };
}
