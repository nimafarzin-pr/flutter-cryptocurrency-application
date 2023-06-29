import 'dart:convert';

OHLCModel ohlcmodelFromJson(String str) => OHLCModel.fromJson(json.decode(str));

String ohlcmodelToJson(OHLCModel data) => json.encode(data.toJson());

class OHLCModel {
  final OHLCSubModel result;

  OHLCModel({
    required this.result,
  });

  OHLCModel copyWith({
    OHLCSubModel? result,
  }) =>
      OHLCModel(
        result: result ?? this.result,
      );

  factory OHLCModel.fromJson(Map<String, dynamic> json) => OHLCModel(
        result: OHLCSubModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class OHLCSubModel {
  final List<List<double>> the3600;
  final List<List<double>> the86400;
  final List<List<double>> the604800;

  OHLCSubModel({
    required this.the3600,
    required this.the86400,
    required this.the604800,
  });

  OHLCSubModel copyWith({
    List<List<double>>? the3600,
    List<List<double>>? the86400,
    List<List<double>>? the604800,
  }) =>
      OHLCSubModel(
        the3600: the3600 ?? this.the3600,
        the86400: the86400 ?? this.the86400,
        the604800: the604800 ?? this.the604800,
      );

  factory OHLCSubModel.fromJson(Map<String, dynamic> json) => OHLCSubModel(
        the3600: List<List<double>>.from(json["3600"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        the86400: List<List<double>>.from(json["86400"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        the604800: List<List<double>>.from(json["604800"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
      );

  Map<String, dynamic> toJson() => {
        "3600": List<dynamic>.from(
            the3600.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "86400": List<dynamic>.from(
            the86400.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "604800": List<dynamic>.from(
            the604800.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
