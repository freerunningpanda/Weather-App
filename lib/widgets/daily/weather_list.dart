import 'package:flutter/material.dart';

import '../../models/weather_forecast.dart';
import '../border_widget.dart';
import 'weather_card.dart';
import '../weather_card_detailed.dart';

class WeatherList extends StatelessWidget {
  final WeatherForecast data;
  const WeatherList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                        state: data,
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12.0)),
                    width: MediaQuery.of(context).size.width / 3.0,
                    child: WeatherCard(state: data, index: index),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                itemCount: data.list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
