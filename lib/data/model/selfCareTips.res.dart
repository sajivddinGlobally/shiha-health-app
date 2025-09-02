// To parse this JSON data, do
//
//     final selfCareTipsResponse = selfCareTipsResponseFromJson(jsonString);

import 'dart:convert';

List<SelfCareTipsResponse> selfCareTipsResponseFromJson(String str) => List<SelfCareTipsResponse>.from(json.decode(str).map((x) => SelfCareTipsResponse.fromJson(x)));

String selfCareTipsResponseToJson(List<SelfCareTipsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelfCareTipsResponse {
    int id;
    String title;
    String videoUrl;
    String description;

    SelfCareTipsResponse({
        required this.id,
        required this.title,
        required this.videoUrl,
        required this.description,
    });

    factory SelfCareTipsResponse.fromJson(Map<String, dynamic> json) => SelfCareTipsResponse(
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
