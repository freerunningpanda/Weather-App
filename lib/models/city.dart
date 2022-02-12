import 'package:json_annotation/json_annotation.dart';

import 'coord.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });

  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
