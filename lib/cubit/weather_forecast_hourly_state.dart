part of 'weather_forecast_hourly_cubit.dart';

@immutable
abstract class WeatherForecastHourlyState {}

class WeatherForecastHourlyInitial extends WeatherForecastHourlyState {}

class WeatherForecastHourlyLoadedState extends WeatherForecastHourlyState {
  final WeatherForecastHourly loadWeather;

  WeatherForecastHourlyLoadedState(this.loadWeather);
}

class WeatherForecastErrorState extends WeatherForecastHourlyState {
  final String errorMessage;

  WeatherForecastErrorState(this.errorMessage);

  @override
  bool operator ==(Object other) {
    if (identical(this, 0)) return true;

    return other is WeatherForecastErrorState &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}
