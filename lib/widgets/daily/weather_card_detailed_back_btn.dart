import 'package:flutter/material.dart';

import '../../models/weather_forecast.dart';

class WeatherCardDetailedBackBtn extends StatelessWidget {
  final WeatherForecast state;
  final int index;
  const WeatherCardDetailedBackBtn(
      {Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return weatherCardDetailedBackBtn(context, state, index);
  }

  Widget weatherCardDetailedBackBtn(
    BuildContext context,
    WeatherForecast state,
    int index,
  ) {
    return SizedBox(
      width: 270.0,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(width: 5),
            Text(
              'Back',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.yellow[700],
          ),
        ),
      ),
    );
  }
}
