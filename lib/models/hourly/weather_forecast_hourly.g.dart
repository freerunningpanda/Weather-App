// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_hourly.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherForecastHourlyAdapter extends TypeAdapter<WeatherForecastHourly> {
  @override
  final int typeId = 8;

  @override
  WeatherForecastHourly read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherForecastHourly(
      lat: fields[0] as double,
      lon: fields[1] as double,
      timezone: fields[2] as String,
      timezoneOffset: fields[3] as int,
      hourly: (fields[4] as List).cast<Hourly>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherForecastHourly obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.timezoneOffset)
      ..writeByte(4)
      ..write(obj.hourly);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherForecastHourlyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
