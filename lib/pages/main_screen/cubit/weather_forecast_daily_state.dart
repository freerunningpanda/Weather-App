part of 'weather_forecast_daily_cubit.dart';

@immutable
abstract class WeatherForecastDailyState {}

class WeatherForecastDailyInitial extends WeatherForecastDailyState {}

class WeatherForecastLoadedState extends WeatherForecastDailyState {
  final WeatherForecast loadWeather;

  WeatherForecastLoadedState(this.loadWeather);
}

class WeatherForecastErrorState extends WeatherForecastDailyState {
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
