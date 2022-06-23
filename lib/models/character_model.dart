// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);
import 'dart:convert';

class CharacterModel {
  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.origin,
    this.location,
    this.type,
    this.gender,
    this.image,
    this.species,
  });

  String? id;
  String? name;
  String? status;
  Location? origin;
  Location? location;
  String? type;
  String? gender;
  String? image;
  String? species;

  factory CharacterModel.fromRawJson(String str) =>
      CharacterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        status: json["status"] == null ? null : json["status"],
        origin:
            json["origin"] == null ? null : Location.fromJson(json["origin"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        type: json["type"] == null ? null : json["type"],
        gender: json["gender"] == null ? null : json["gender"],
        image: json["image"] == null ? null : json["image"],
        species: json["species"] == null ? null : json["species"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "status": status == null ? null : status,
        "origin": origin == null ? null : origin!.toJson(),
        "location": location == null ? null : location!.toJson(),
        "type": type == null ? null : type,
        "gender": gender == null ? null : gender,
        "image": image == null ? null : image,
        "species": species == null ? null : species,
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
