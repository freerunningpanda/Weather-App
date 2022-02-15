import 'package:flutter/material.dart';

import '../models/hourly/weather_forecast_hourly.dart';
import '../utilities/forecast_util.dart';
import 'border_widget.dart';
import 'weather_card_hourly.dart';
import 'weather_card_detailed_hourly.dart';

class WeatherListHourly extends StatelessWidget {
  final WeatherForecastHourly data;
  const WeatherListHourly({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: borderWidget(),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Hourly weather forecast'.toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              Util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(
                  data.hourly[0].dt * 1000)),
              style: const TextStyle(fontSize: 15),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherCardDetailedHourly(
                          index: index,
                          state: data,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12.0)),
                    width: MediaQuery.of(context).size.width / 3.0,
                    child: WeatherCardHourly(state: data, index: index),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                itemCount: data.hourly.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
