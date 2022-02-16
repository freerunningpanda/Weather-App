import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'city.dart';
import 'coord.dart';
import 'feels_like.dart';
import 'temp.dart';
import 'weather_list.dart';
import 'weather.dart';

part 'weather_forecast.g.dart';

@HiveType(typeId: 0)
class WeatherBox extends HiveObject {
  @HiveField(0)
  var city = <City>[];
  @HiveField(1)
  var coord = <Coord>[];
  @HiveField(2)
  var feelsLike = <FeelsLike>[];
  @HiveField(3)
  var temp = <Temp>[];
  @HiveField(4)
  var weatherForecast = <WeatherForecast>[];
  @HiveField(5)
  var weatherList = <WeatherList>[];
  @HiveField(6)
  var weather = <Weather>[];
}

@HiveType(typeId: 1)
@JsonSerializable()
class WeatherForecast extends HiveObject {
  WeatherForecast({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  @HiveField(0)
  final City city;
  @HiveField(1)
  final String cod;
  @HiveField(2)
  final double message;
  @HiveField(3)
  final int cnt;
  @HiveField(4)
  final List<WeatherList> list;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}
