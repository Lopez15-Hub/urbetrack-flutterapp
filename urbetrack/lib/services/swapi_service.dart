import 'dart:convert';

import 'package:urbetrack/global/enviroments.dart';
import 'package:urbetrack/models/star_wars_api_response.dart';
import 'package:http/http.dart' as http;

class SwapiService {
  Future<StarWarsApiResponse> getStarWarsCharactersData() async {
    try {
      final response = await http.get(Enviroments.peopleUri);
      if (response.statusCode == 200) return StarWarsApiResponse.fromJson(json.decode(response.body));
      throw Exception('Failed to get characters: Error code: ${response.statusCode}');
    
    } catch (error) {
      throw Exception('Oh no! We have a problem. Check it! : $error');
    }
  }
}
