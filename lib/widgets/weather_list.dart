import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/main_screen/cubit/weather_forecast_daily_cubit.dart';
import '../widgets/weather_card.dart';
import '../widgets/weather_card_detailed.dart';
import '../widgets/border_widget.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
      builder: (context, state) {
        if (state is WeatherForecastLoadedState) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: borderWidget(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Weather forecast for 7 days'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherCardDetailed(
                              index: index,
                              state: state.loadWeather,
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(12.0)),
                          width: MediaQuery.of(context).size.width / 3.0,
                          child: weatherCard(state.loadWeather, index),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                      itemCount: state.loadWeather.list.length,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
