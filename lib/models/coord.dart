import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coord.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Coord extends HiveObject {
  Coord({
    required this.lon,
    required this.lat,
  });

  @HiveField(0)
  final double lon;
  @HiveField(1)
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}
