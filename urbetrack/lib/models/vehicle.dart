class Vehicle {
  Vehicle({
    required this.name,
    required this.url,
  });

  String name, url;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        name: json["name"].toString(),
        url: json["url"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toString(),
        "url": url.toString(),
      };
}
