import 'weather_api.dart';
import '../models/weather_forecast.dart';
import '../models/hourly/weather_forecast_hourly.dart';

class WeatherRepository {
  final weatherApiProvider = WeatherApi();
  Future<WeatherForecast> fetchWeatherForecastWithCity(
          {String? cityName, bool isDaily = false}) =>
      weatherApiProvider.fetchWeatherForecast(cityName: cityName);

  Future<WeatherForecastHourly> fetchWeatherForecastHourly() =>
      weatherApiProvider.fetchWeatherForecastHourly();
}
