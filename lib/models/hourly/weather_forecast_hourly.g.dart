// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastHourly _$WeatherForecastHourlyFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastHourly(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      timezone: json['timezone'] as String,
      timezoneOffset: json['timezone_offset'] as int,
      hourly: (json['hourly'] as List<dynamic>)
          .map((e) => Hourly.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherForecastHourlyToJson(
        WeatherForecastHourly instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'hourly': instance.hourly,
    };
