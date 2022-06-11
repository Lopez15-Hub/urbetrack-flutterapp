class Starship {
    Starship({
       required this.name,
       required this.url,
    });

    String name;
    String url;

    factory Starship.fromJson(Map<String, dynamic> json) => Starship(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}