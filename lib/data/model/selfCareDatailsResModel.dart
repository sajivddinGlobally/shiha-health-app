// To parse this JSON data, do
//
//     final selfCareDetailsResModel = selfCareDetailsResModelFromJson(jsonString);

import 'dart:convert';

SelfCareDetailsResModel selfCareDetailsResModelFromJson(String str) => SelfCareDetailsResModel.fromJson(json.decode(str));

String selfCareDetailsResModelToJson(SelfCareDetailsResModel data) => json.encode(data.toJson());

class SelfCareDetailsResModel {
    int id;
    String title;
    String videoUrl;
    String description;

    SelfCareDetailsResModel({
        required this.id,
        required this.title,
        required this.videoUrl,
        required this.description,
    });

    factory SelfCareDetailsResModel.fromJson(Map<String, dynamic> json) => SelfCareDetailsResModel(
        id: json["id"],
        title: json["title"],
        videoUrl: json["video_url"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "video_url": videoUrl,
        "description": description,
    };
}
