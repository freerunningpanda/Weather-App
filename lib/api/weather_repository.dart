import 'weather_api.dart';
import '../models/weather_forecast.dart';

class WeatherRepository {
  final weatherApiProvider = WeatherApi();
  Future<WeatherForecast> fetchWeatherForecastWithCity({String? cityName}) =>
      weatherApiProvider.fetchWeatherForecast(cityName: cityName);
}
