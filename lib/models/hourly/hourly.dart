import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import '/utilities/constants.dart';
import 'weather.dart';

part 'hourly.g.dart';

@HiveType(typeId: 9)
@JsonSerializable()
class Hourly extends HiveObject {
  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });

  @HiveField(0)
  final int dt;
  @HiveField(1)
  final double temp;
  @HiveField(2)
  final double feelsLike;
  @HiveField(3)
  final int pressure;
  @HiveField(4)
  final int humidity;
  @HiveField(5)
  final double dewPoint;
  @HiveField(6)
  final double uvi;
  @HiveField(7)
  final int clouds;
  @HiveField(8)
  final int visibility;
  @HiveField(9)
  final double windSpeed;
  @HiveField(10)
  final int windDeg;
  @HiveField(11)
  final double windGust;
  @HiveField(12)
  final List<Weather> weather;
  @HiveField(13)
  final int pop;

  String getIconUrl() {
    return Constants.weatherImagesUrl + weather[0].icon + '.png';
  }

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
