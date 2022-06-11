import 'package:http/http.dart' as http;
import 'package:urbetrack/global/endpoints.dart';

import '../models/report.dart';

Future<bool> reportToJsonPlaceholder(Report report) async {
  if (report.isEmpty()) throw Exception('Report is required.');

  try {
    final response = await http.post(Enviroments.jsonPlaceHolderUri, body: {
      'userId': report.userId.toString(),
      'dateTime': report.dateTime.toString(),
      'characterName': report.characterName,
    });
    if (response.statusCode == 200 || response.statusCode == 201 )print("Successfully reported to JsonPlaceholder");
    return true;

  } catch (error) {
    throw Exception('Oh no! We have a problem, check it out: $error');
  }
}
