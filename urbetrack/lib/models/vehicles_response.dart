
import 'dart:convert';

import 'package:urbetrack/models/vehicle.dart';

VehiclesResponse vehiclesResponseFromJson(String str) => VehiclesResponse.fromJson(json.decode(str));

String vehiclesResponseToJson(VehiclesResponse data) => json.encode(data.toJson());

class VehiclesResponse {
    VehiclesResponse({
        required this.count,
        required this.next,
        this.previous,
        required this.results,
    });

    int count;
    String next;
    dynamic previous;
    List<Vehicle> results;

    factory VehiclesResponse.fromJson(Map<String, dynamic> json) => VehiclesResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"].toString(),
        results: List<Vehicle>.from(json["results"].map((x) => Vehicle.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous.toString(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}


