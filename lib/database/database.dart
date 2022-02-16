import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '/models/city.dart';
import '/models/coord.dart';
import '/models/feels_like.dart';
import '/models/hourly/hourly.dart';
import '/models/hourly/weather_forecast_hourly.dart';
import '/models/temp.dart';
import '/models/weather.dart';
import '/models/weather_forecast.dart';
import '/models/weather_list.dart';

import '/models/hourly/weather.dart' as weather_adapter_houly;
import '/utilities/constants.dart';

const bool deleteBox = false;

class Database {
  Future<void> runHive() async {
    final document = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(document.path);
    Hive.registerAdapter(WeatherBoxAdapter());
    Hive.registerAdapter(WeatherForecastAdapter());
    Hive.registerAdapter(CityAdapter());
    Hive.registerAdapter(CoordAdapter());
    Hive.registerAdapter(FeelsLikeAdapter());
    Hive.registerAdapter(TempAdapter());
    Hive.registerAdapter(WeatherListAdapter());
    Hive.registerAdapter(WeatherAdapter());
    Hive.registerAdapter(HourlyAdapter());
    Hive.registerAdapter(WeatherForecastHourlyAdapter());
    Hive.registerAdapter(weather_adapter_houly.WeatherAdapter());
    if (deleteBox) {
      await Hive.deleteBoxFromDisk(Constants.weatherCityInfo);
      await Hive.deleteBoxFromDisk(Constants.weatherDailyList);
      await Hive.deleteBoxFromDisk(Constants.weatherHourlyDetailed);
      await Hive.deleteBoxFromDisk(Constants.weatherHourlyList);
      await Hive.deleteBoxFromDisk(Constants.weatherHourlyDetailed);
    }
    await Hive.openBox<WeatherBox>(Constants.weatherCityInfo);
    await Hive.openBox<WeatherBox>(Constants.weatherDailyList);
    await Hive.openBox<WeatherBox>(Constants.weatherHourlyDetailed);
    await Hive.openBox<WeatherBox>(Constants.weatherHourlyList);
    await Hive.openBox<WeatherBox>(Constants.weatherHourlyDetailed);
  }
}
