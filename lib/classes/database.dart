import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class DatabseFileEvents {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_persistence.json');
  }

  Future<String> readEvents() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        await writeEvents('{"events": []}');
      }
      return file.readAsString();
    } catch (e) {
      print('Error reading event: $e');
      return '';
    }
  }

  Future<File> writeEvents(String json) async {
    final file = await _localFile;
    return file.writeAsString(json);
  }
}

Database databaseFromJson(String str) {
  final dataFromJson = json.decode(str);
  return Database.fromJson(dataFromJson);
}

String databaseToJson(Database data) {
  final dataToJson = data.toJson();
  return json.encode(dataToJson);
}

class Database {
  List<EventInfo> event;

  Database({required this.event});

  factory Database.fromJson(Map<String, dynamic> json) => Database(
        event: List<EventInfo>.from(
            json["events"].map((x) => EventInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(event.map((e) => e.toJson())),
      };
}

class EventInfo {
  String id;
  String name;
  String type;
  String description;

  EventInfo({
    this.id = "",
    this.name = "",
    this.type = "",
    this.description = "",
  });

  factory EventInfo.fromJson(Map<String, dynamic> json) => EventInfo(
        id: json["id"] ?? '',
        name: json['name'] ?? '',
        type: json['type'] ?? '',
        description: json['description'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "description": description,
      };
}

class EventInfoEdit {
  String action;
  EventInfo event;

  EventInfoEdit({required this.action, required this.event});
}
