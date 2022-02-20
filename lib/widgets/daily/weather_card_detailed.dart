import 'package:flutter/material.dart';

import '../../models/weather_forecast.dart';
import '../background_widget.dart';
import '../border_widget.dart';
import 'weather_card_detailed_back_btn.dart';
import 'weather_card_detailed_citytemp.dart';
import 'weather_card_detailed_feels_like.dart';
import 'weather_card_detailed_min_max.dart';
import 'weather_card_detailed_wind.dart';

class WeatherCardDetailed extends StatelessWidget {
  final WeatherForecast state;
  final int index;
  const WeatherCardDetailed(
      {Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherCardDetailed(context, state, index),
    );
  }

  Widget weatherCardDetailed(
    BuildContext context,
    WeatherForecast state,
    int index,
  ) {
    var forecastList = state.list;
    forecastList[index].weather[0].description.toUpperCase();
    forecastList[index].weather[0].description.toUpperCase();
    forecastList[index].weather[0].description.toUpperCase();

    return Container(
      height: double.infinity,
      decoration: backGroundWidget(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: borderWidget(),
            child: Column(
              children: [
                const SizedBox(height: 16),
                WeatherCardDetailedCityTemp(index: index, state: state),
                WeatherCardDetailedMinMax(index: index, state: state),
                const SizedBox(
                  height: 20,
                ),
                WeatherCardDetailedFeelsLike(index: index, state: state),
                const SizedBox(
                  height: 20,
                ),
                WeatherCardDetailedWind(index: index, state: state),
                const Expanded(child: SizedBox()),
                WeatherCardDetailedBackBtn(index: index, state: state),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
