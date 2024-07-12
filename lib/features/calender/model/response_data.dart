import 'dart:convert';

class ResponseData {
  List<Datum>? data;

  ResponseData({
    this.data,
  });

  ResponseData copyWith({
    List<Datum>? data,
  }) =>
      ResponseData(
        data: data ?? this.data,
      );

  factory ResponseData.fromRawJson(String str) =>
      ResponseData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? date;
  String? name;
  String? category;
  String? location;

  Datum({
    this.date,
    this.name,
    this.category,
    this.location,
  });

  Datum copyWith({
    String? date,
    String? name,
    String? category,
    String? location,
  }) =>
      Datum(
        date: date ?? this.date,
        name: name ?? this.name,
        category: category ?? this.category,
        location: location ?? this.location,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: json["date"],
        name: json["name"],
        category: json["category"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "name": name,
        "category": category,
        "location": location,
      };
}
