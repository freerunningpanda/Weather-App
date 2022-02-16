import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import 'feels_like.dart';
import 'temp.dart';
import 'weather.dart';
import '../utilities/constants.dart';

part 'weather_list.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class WeatherList extends HiveObject {
  WeatherList({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.pop,
    required this.rain,
  });

  @HiveField(0)
  final int dt;
  @HiveField(1)
  final int sunrise;
  @HiveField(2)
  final int sunset;
  @HiveField(3)
  final Temp temp;
  @HiveField(4)
  final FeelsLike feelsLike;
  @HiveField(5)
  final int pressure;
  @HiveField(6)
  final int humidity;
  @HiveField(7)
  final List<Weather> weather;
  @HiveField(8)
  final double speed;
  @HiveField(9)
  final int deg;
  @HiveField(10)
  final double gust;
  @HiveField(11)
  final int clouds;
  @HiveField(12)
  final double pop;
  @HiveField(13)
  final double? rain;

  String getIconUrl() {
    return Constants.weatherImagesUrl + weather[0].icon + '.png';
  }

  factory WeatherList.fromJson(Map<String, dynamic> json) =>
      _$WeatherListFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherListToJson(this);
}
