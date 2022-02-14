import 'package:json_annotation/json_annotation.dart';

import 'hourly.dart';

part 'weather_forecast_hourly.g.dart';

@JsonSerializable()
class WeatherForecastHourly {
  WeatherForecastHourly({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.hourly,
  });

  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final List<Hourly> hourly;

  factory WeatherForecastHourly.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastHourlyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastHourlyToJson(this);
}
