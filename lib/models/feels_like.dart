import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feels_like.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class FeelsLike extends HiveObject {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  @HiveField(0)
  final double day;
  @HiveField(1)
  final double night;
  @HiveField(2)
  final double eve;
  @HiveField(3)
  final double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}
