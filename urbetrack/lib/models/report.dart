
import 'dart:convert';

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

class Report {
    Report({
       required this.userId,
       required  this.dateTime,
       required this.characterName,
    });

    int userId;
    DateTime dateTime;
    String characterName;

    factory Report.fromJson(Map<String, dynamic> json) => Report(
        userId: json["userId"],
        dateTime: DateTime.parse(json["dateTime"]),
        characterName: json["character_name"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "dateTime": dateTime.toIso8601String(),
        "character_name": characterName,
    };
    isEmpty() {
      if (userId.toString().isEmpty || dateTime.toString().isEmpty || characterName.toString().isEmpty) {
        return true;
      }
      return false;
    }
}
