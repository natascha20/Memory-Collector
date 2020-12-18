// To parse this JSON data, do
//
//     final memoryCollector = memoryCollectorFromJson(jsonString);

import 'dart:convert';

MemoryCollector memoryCollectorFromJson(String str) => MemoryCollector.fromJson(json.decode(str));

String memoryCollectorToJson(MemoryCollector data) => json.encode(data.toJson());

class MemoryCollector {
  MemoryCollector({
    this.id,
    this.title,
    this.discription,
    this.date,
    this.image,
  });

  int id;
  String title;
  String discription;
  String date;
  String image;

  factory MemoryCollector.fromJson(Map<String, dynamic> json) => MemoryCollector(
    id: json["id"],
    title: json["title"],
    discription: json["discription"],
    date: json["date"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "discription": discription,
    "date": date,
    "image": image,
  };
}
