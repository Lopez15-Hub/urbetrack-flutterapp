import 'dart:convert';
import 'package:urbetrack/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:urbetrack/models/starship.dart';

class SwapiService {
  Future<CharacterResponse> getStarWarsCharactersData(nextPage) async {
    try {
      final response = await http.get(Uri.parse(nextPage));

      return CharacterResponse.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it out! : $error');
    }
  }

  Future<String> getPlanetName(planetUrl) async {
    try {
      final response = await http.get(Uri.parse(planetUrl));
      return Planet.fromJson(json.decode(response.body)).name;
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it out! : $error');
    }
  }

  Future getVehicles(List<String> vehicles) async {
    try {
      final vehiclesData = vehicles.map((vehicleUrl) async {
        final response = await http.get(Uri.parse(vehicleUrl));
        return Vehicle.fromJson(jsonDecode(response.body));
      });

      final List<Vehicle> characterVehicles = await Future.wait(vehiclesData);

      return characterVehicles;
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it out! : $error');
    }
  }

  Future getStarships(List<String> starships) async {
    try {
      final starshipsData = starships.map((starshipUrl) async {
        final response = await http.get(Uri.parse(starshipUrl));
        return Starship.fromJson(jsonDecode(response.body));
      });

      final List<Starship> characterStarships =
          await Future.wait(starshipsData);

      return characterStarships;
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it out! : $error');
    }
  }
}
