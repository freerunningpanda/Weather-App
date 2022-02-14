import 'weather_api.dart';
import '../models/weather_forecast.dart';

class WeatherRepository {
  final weatherApiProvider = WeatherApi();
  Future<WeatherForecast> fetchWeatherForecastWithCity(
          {String? cityName, bool isDaily = false}) =>
      weatherApiProvider.fetchWeatherForecast(
          cityName: cityName, isDaily: false);
}
