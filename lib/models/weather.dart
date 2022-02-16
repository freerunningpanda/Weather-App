import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@HiveType(typeId: 7)
@JsonSerializable()
class Weather extends HiveObject {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String main;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
