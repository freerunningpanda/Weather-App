// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherBoxAdapter extends TypeAdapter<WeatherBox> {
  @override
  final int typeId = 0;

  @override
  WeatherBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherBox()
      ..city = (fields[0] as List).cast<City>()
      ..coord = (fields[1] as List).cast<Coord>()
      ..feelsLike = (fields[2] as List).cast<FeelsLike>()
      ..temp = (fields[3] as List).cast<Temp>()
      ..weatherForecast = (fields[4] as List).cast<WeatherForecast>()
      ..weatherList = (fields[5] as List).cast<WeatherList>()
      ..weather = (fields[6] as List).cast<Weather>();
  }

  @override
  void write(BinaryWriter writer, WeatherBox obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.coord)
      ..writeByte(2)
      ..write(obj.feelsLike)
      ..writeByte(3)
      ..write(obj.temp)
      ..writeByte(4)
      ..write(obj.weatherForecast)
      ..writeByte(5)
      ..write(obj.weatherList)
      ..writeByte(6)
      ..write(obj.weather);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherForecastAdapter extends TypeAdapter<WeatherForecast> {
  @override
  final int typeId = 1;

  @override
  WeatherForecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherForecast(
      city: fields[0] as City,
      cod: fields[1] as String,
      message: fields[2] as double,
      cnt: fields[3] as int,
      list: (fields[4] as List).cast<WeatherList>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherForecast obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.cod)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.cnt)
      ..writeByte(4)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    WeatherForecast(
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      cod: json['cod'] as String,
      message: (json['message'] as num).toDouble(),
      cnt: json['cnt'] as int,
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'city': instance.city,
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
    };
