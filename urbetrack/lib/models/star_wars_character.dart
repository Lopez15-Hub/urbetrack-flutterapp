class StarWarsCharacter {
  StarWarsCharacter({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.vehicles,
    required this.starships,
  });

  String name;
  String height;
  String mass;
  String hairColor;
  String eyeColor;
  String birthYear;
  String gender;
  String homeworld;
  List<String> vehicles;
  List<String> starships;

  copyWith(
    String? name,
    String? height,
    String? mass,
    String? hairColor,
    String? eyeColor,
    String? birthYear,
    String? gender,
    String? homeworld,
    List<String>? vehicles,
    List<String>? starships,
  ) =>
      StarWarsCharacter(
          name: name ?? this.name,
          height: height ?? this.height,
          mass: mass ?? this.mass,
          hairColor: hairColor ?? this.hairColor,
          eyeColor: eyeColor ?? this.hairColor,
          birthYear: birthYear ?? this.birthYear,
          gender: gender ?? this.gender,
          homeworld: homeworld ?? this.homeworld,
          vehicles: vehicles ?? this.vehicles,
          starships: starships ?? this.starships);

  factory StarWarsCharacter.fromJson(Map<String, dynamic> json) =>
      StarWarsCharacter(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"],
        homeworld: json["homeworld"],
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": gender,
        "homeworld": homeworld,
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
      };
}
