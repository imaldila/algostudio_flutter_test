// To parse this JSON data, do
//
//     final meme = memeFromJson(jsonString);

import 'dart:convert';

Meme memeFromJson(String str) => Meme.fromJson(json.decode(str));

String memeToJson(Meme data) => json.encode(data.toJson());

class Meme {
    Meme({
        this.success,
        this.data,
    });

    final bool? success;
    final MemeData? data;

    factory Meme.fromJson(Map<String, dynamic> json) => Meme(
        success: json["success"],
        data: MemeData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
    };
}

class MemeData {
    MemeData({
        this.memes,
    });

    final List<MemeElement>? memes;

    factory MemeData.fromJson(Map<String, dynamic> json) => MemeData(
        memes: List<MemeElement>.from(json["memes"].map((x) => MemeElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "memes": List<dynamic>.from(memes!.map((x) => x.toJson())),
    };
}

class MemeElement {
    MemeElement({
        this.id,
        this.name,
        this.url,
        this.width,
        this.height,
        this.boxCount,
        this.captions,
    });

    final String? id;
    final String? name;
    final String? url;
    final int? width;
    final int? height;
    final int? boxCount;
    final int? captions;

    factory MemeElement.fromJson(Map<String, dynamic> json) => MemeElement(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        boxCount: json["box_count"],
        captions: json["captions"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "width": width,
        "height": height,
        "box_count": boxCount,
        "captions": captions,
    };
}
