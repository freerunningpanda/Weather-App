// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherListAdapter extends TypeAdapter<WeatherList> {
  @override
  final int typeId = 6;

  @override
  WeatherList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherList(
      dt: fields[0] as int,
      sunrise: fields[1] as int,
      sunset: fields[2] as int,
      temp: fields[3] as Temp,
      feelsLike: fields[4] as FeelsLike,
      pressure: fields[5] as int,
      humidity: fields[6] as int,
      weather: (fields[7] as List).cast<Weather>(),
      speed: fields[8] as double,
      deg: fields[9] as int,
      gust: fields[10] as double,
      clouds: fields[11] as int,
      pop: fields[12] as double,
      rain: fields[13] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherList obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.temp)
      ..writeByte(4)
      ..write(obj.feelsLike)
      ..writeByte(5)
      ..write(obj.pressure)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.weather)
      ..writeByte(8)
      ..write(obj.speed)
      ..writeByte(9)
      ..write(obj.deg)
      ..writeByte(10)
      ..write(obj.gust)
      ..writeByte(11)
      ..write(obj.clouds)
      ..writeByte(12)
      ..write(obj.pop)
      ..writeByte(13)
      ..write(obj.rain);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
