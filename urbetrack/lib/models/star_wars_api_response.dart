// To parse this JSON data, do
//
//     final starWarsApiResponse = starWarsApiResponseFromJson(jsonString);

import 'dart:convert';

import 'package:urbetrack/models/models.dart';

StarWarsApiResponse starWarsApiResponseFromJson(String str) => StarWarsApiResponse.fromJson(json.decode(str));

String starWarsApiResponseToJson(StarWarsApiResponse data) => json.encode(data.toJson());

class StarWarsApiResponse {
    StarWarsApiResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    int count;
    String next;
    dynamic previous;
    List<StarWarsCharacter> results;




    factory StarWarsApiResponse.fromJson(Map<String, dynamic> json) => StarWarsApiResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"].toString(),
        results: List<StarWarsCharacter>.from(json["results"].map((x) => StarWarsCharacter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous.toString(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}
