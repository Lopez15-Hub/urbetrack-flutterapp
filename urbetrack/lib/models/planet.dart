
import 'dart:convert';

Planet planetFromJson(String str) => Planet.fromJson(json.decode(str));

String planetToJson(Planet data) => json.encode(data.toJson());

class Planet {
    Planet({
        required this.name,

    });

    String name;


    factory Planet.fromJson(Map<String, dynamic> json) => Planet(
        name: json["name"],

    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
