import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
  Response({
    required this.object,
  });

  final Object object;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        object: Object.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {
        "object": object.toJson(),
      };
}

class Object {
  Object({
    required this.status,
    required this.content,
  });

  final String status;
  final String content;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        status: json["status"],
        content: jsonEncode(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": content,
      };
}
