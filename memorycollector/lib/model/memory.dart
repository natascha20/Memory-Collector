import 'dart:convert';
import 'dart:html';

Memory memoryFromJson(String str) => Memory.fromJason(json.decode(str));

String memoryToJson(Memory data) => json.encode(data.toJson());

class Memory {
  String title;
  String description;
  //Url image;
  DateTime date;

  Memory({
    this.title,
    this.description,
    //this.image,
    this.date,
  });

  factory Memory.fromJason(Map<String, dynamic> json) => Memory(
    title: json["title"],
    description: json["description"],
    //image: json["image"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() =>{
    "title": title,
    "description": description,
    //"image": image,
    "date": date,
  };

}