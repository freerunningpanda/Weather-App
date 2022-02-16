import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import 'coord.dart';

part 'city.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class City extends HiveObject {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final Coord coord;
  @HiveField(3)
  final String country;
  @HiveField(4)
  final int population;
  @HiveField(5)
  final int timezone;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
