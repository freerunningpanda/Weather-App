import 'package:json_annotation/json_annotation.dart';

import 'city.dart';
import 'weather_list.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  WeatherForecast({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  final City city;
  final String cod;
  final double message;
  final int cnt;
  final List<WeatherList> list;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}
