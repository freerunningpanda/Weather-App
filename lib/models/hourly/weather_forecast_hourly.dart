import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import 'hourly.dart';

part 'weather_forecast_hourly.g.dart';

class WeatherHourlyBox {}

@HiveType(typeId: 8)
@JsonSerializable()
class WeatherForecastHourly extends HiveObject {
  WeatherForecastHourly({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.hourly,
  });

  @HiveField(0)
  final double lat;
  @HiveField(1)
  final double lon;
  @HiveField(2)
  final String timezone;
  @HiveField(3)
  final int timezoneOffset;
  @HiveField(4)
  final List<Hourly> hourly;

  factory WeatherForecastHourly.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastHourlyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastHourlyToJson(this);
}
