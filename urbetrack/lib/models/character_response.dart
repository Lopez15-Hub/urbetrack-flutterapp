
import 'dart:convert';

import 'package:urbetrack/models/models.dart';

CharacterResponse starWarsApiResponseFromJson(String str) =>
    CharacterResponse.fromJson(json.decode(str));

String starWarsApiResponseToJson(CharacterResponse data) =>
    json.encode(data.toJson());

class CharacterResponse {
  CharacterResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Character> results;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      CharacterResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"].toString(),
        results: List<Character>.from(
            json["results"].map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous.toString(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
