// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherList _$WeatherListFromJson(Map<String, dynamic> json) => WeatherList(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      temp: Temp.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'] as int,
      gust: (json['gust'] as num).toDouble(),
      clouds: json['clouds'] as int,
      pop: (json['pop'] as num).toDouble(),
      rain: (json['rain'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherListToJson(WeatherList instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'weather': instance.weather,
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
    };
