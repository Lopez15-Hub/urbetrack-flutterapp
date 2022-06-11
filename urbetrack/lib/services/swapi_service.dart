import 'dart:convert';

import 'package:urbetrack/global/endpoints.dart';
import 'package:urbetrack/models/models.dart';
import 'package:http/http.dart' as http;

class SwapiService {
  Future<CharacterResponse> getStarWarsCharactersData() async {
    try {
      final response = await http.get(Enviroments.peopleUri);
      if (response.statusCode != 200)throw Exception('Failed to get characters: Error code: ${response.statusCode}');

      return CharacterResponse.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it! : $error');
    }
  }

  Future<String> getPlanetName(planetUrl) async {
    try {
      final response = await http.get(Uri.parse(planetUrl));

      if (response.statusCode != 200)throw Exception('Failed to get planet name: Error code: ${response.statusCode}');

      return Planet.fromJson(json.decode(response.body)).name;
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it! : $error');
    }
  }

  Future<String> getStarships(planetUrl) async {
    try {
      final response = await http.get(Uri.parse(planetUrl));

      if (response.statusCode != 200)throw Exception('Failed to get planet name: Error code: ${response.statusCode}');

      return Planet.fromJson(json.decode(response.body)).name;
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it! : $error');
    }
  }

  Future<VehiclesResponse> getVehicles() async {
    try {
      final response = await http.get(Enviroments.vehiclesUrl);
      if (response.statusCode != 200)throw Exception('Failed to get vehicles: Error code: ${response.statusCode}');

      return VehiclesResponse.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it! : $error');
    }
  }
}
