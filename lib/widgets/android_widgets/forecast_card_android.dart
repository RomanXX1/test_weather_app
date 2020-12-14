import 'package:flutter/material.dart';
import 'package:test_app_weather/server/weather_forecast.dart';
import 'package:test_app_weather/utils/forecast_util.dart';

Widget forecastCard(WeatherForecast snapshot, int index) {
  var forecastList = snapshot.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];

  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var tempMax = forecastList[index].temp.max.toStringAsFixed(0);

  var icon = forecastList[index].getIconURL();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$tempMin ℃ .. $tempMax ℃',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Image.network(
                icon,
                scale: 1.2,
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
