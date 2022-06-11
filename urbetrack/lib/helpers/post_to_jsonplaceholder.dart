import 'package:http/http.dart' as http;
import 'package:urbetrack/global/endpoints.dart';

import '../models/report.dart';

Future<bool> reportToJsonPlaceholder(String url, Report report) async {
  
  if (url.isEmpty || report.isEmpty()) throw Exception('URL and Report is required.');

  try {
    final response =await http.post(Enviroments.jsonPlaceHolderURL, body: report);

    if (response.statusCode != 200) throw Exception('Failed to report to JsonPlaceholder error code: ${response.statusCode}');
    
    return true;


  } catch (error) {
    
    
    throw Exception('Oh no! We have a problem, check it out: $error');
  
  }
}
