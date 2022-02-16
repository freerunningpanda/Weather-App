import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'temp.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class Temp extends HiveObject {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  @HiveField(0)
  final double day;
  @HiveField(1)
  final double min;
  @HiveField(2)
  final double max;
  @HiveField(3)
  final double night;
  @HiveField(4)
  final double eve;
  @HiveField(5)
  final double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}
