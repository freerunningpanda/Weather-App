import 'package:json_annotation/json_annotation.dart';

import 'feels_like.dart';
import 'temp.dart';
import 'weather.dart';
import '../utilities/constants.dart';

part 'weather_list.g.dart';

@JsonSerializable()
class WeatherList {
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

  final int dt;
  final int sunrise;
  final int sunset;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final List<Weather> weather;
  final double speed;
  final int deg;
  final double gust;
  final int clouds;
  final double pop;
  final double? rain;

  String getIconUrl() {
    return Constants.weatherImagesUrl + weather[0].icon + '.png';
  }

  factory WeatherList.fromJson(Map<String, dynamic> json) =>
      _$WeatherListFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherListToJson(this);
}
