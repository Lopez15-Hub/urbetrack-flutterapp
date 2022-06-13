
import 'dart:convert';

import 'package:urbetrack/models/starship.dart';

StarshipResponse starshipResponseFromJson(String str) => StarshipResponse.fromJson(json.decode(str));

String starshipResponseToJson(StarshipResponse data) => json.encode(data.toJson());

class StarshipResponse {
    StarshipResponse({
        required this.count,
        required this.next,
        this.previous,
        required this.results,
    });

    int count;
    String next;
    dynamic previous;
    List<Starship> results;

    factory StarshipResponse.fromJson(Map<String, dynamic> json) => StarshipResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Starship>.from(json["results"].map((x) => Starship.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}


