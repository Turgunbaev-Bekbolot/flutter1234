// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class CharacterModel {
  CharacterModel({
    this.data,
  });

  Data? data;

  factory CharacterModel.fromRawJson(String str) =>
      CharacterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.characters,
  });

  Characters? characters;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        characters: json["characters"] == null
            ? null
            : Characters.fromJson(json["characters"]),
      );

  Map<String, dynamic> toJson() => {
        "characters": characters == null ? null : characters!.toJson(),
      };
}

class Characters {
  Characters({
    this.results,
  });

  List<Result>? results;

  factory Characters.fromRawJson(String str) =>
      Characters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.status,
    this.origin,
    this.location,
    this.type,
    this.gender,
  });

  String? id;
  String? name;
  Status? status;
  Location? origin;
  Location? location;
  String? type;
  Gender? gender;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
        origin:
            json["origin"] == null ? null : Location.fromJson(json["origin"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        type: json["type"] == null ? null : json["type"],
        gender:
            json["gender"] == null ? null : genderValues.map[json["gender"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "status": status == null ? null : statusValues.reverse[status],
        "origin": origin == null ? null : origin!.toJson(),
        "location": location == null ? null : location!.toJson(),
        "type": type == null ? null : type,
        "gender": gender == null ? null : genderValues.reverse[gender],
      };
}

enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues(
    {"Female": Gender.FEMALE, "Male": Gender.MALE, "unknown": Gender.UNKNOWN});

class Location {
  Location({
    this.name,
  });

  String? name;

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };
}

enum Status { ALIVE, UNKNOWN, DEAD }

final statusValues = EnumValues(
    {"Alive": Status.ALIVE, "Dead": Status.DEAD, "unknown": Status.UNKNOWN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
