import 'dart:convert';

List<Analise> analiseFromJson(String str) => List<Analise>.from(json.decode(str).map((x) => Analise.fromJson(x)));

String analiseToJson(List<Analise> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Analise {
  Analise({
    required this.idAnalise,
    required this.idUsuario,
    required this.dataUpload,
    required this.dataEdicao,
    required this.local,
    required this.area,
    required this.pH,
    required this.hAl,
    required this.al,
    required this.ca,
    required this.mg,
    required this.k,
    required this.na,
  });

  final String idAnalise;
  final String idUsuario;
  final DateTime dataUpload;
  final DateTime dataEdicao;
  final String local;
  final double area;
  final double pH;
  final double hAl;
  final double al;
  final double ca;
  final double mg;
  final double k;
  final double na;

  factory Analise.fromJson(Map<String, dynamic> json) => Analise(
        idAnalise: json["id_analise"],
        idUsuario: json["id_usuario"],
        dataUpload: DateTime.parse(json["data_upload"]),
        dataEdicao: DateTime.parse(json["data_edicao"]),
        local: json["local"],
        area: _parseDouble(json["area"]),
        pH: _parseDouble(json["pH"]),
        hAl: _parseDouble(json["HAl"]),
        al: _parseDouble(json["Al"]),
        ca: _parseDouble(json["Ca"]),
        mg: _parseDouble(json["Mg"]),
        k: _parseDouble(json["K"]),
        na: _parseDouble(json["Na"]),
      );

  static double _parseDouble(String value) {
    try {
      return double.parse(value);
    } catch (e) {
      return 0;
    }
  }

  Map<String, dynamic> toJson() => {
        "id_analise": idAnalise,
        "id_usuario": idUsuario,
        "data_upload": dataUpload.toIso8601String(),
        "data_edicao": dataEdicao.toIso8601String(),
        "local": local,
        "area": area,
        "pH": pH,
        "HAl": hAl,
        "Al": al,
        "Ca": ca,
        "Mg": mg,
        "K": k,
        "Na": na,
      };
}
