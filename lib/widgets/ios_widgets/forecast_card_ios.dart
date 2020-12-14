import 'package:flutter/cupertino.dart';
import 'package:test_app_weather/server/weather_forecast.dart';
import 'package:test_app_weather/utils/forecast_util.dart';

Widget forecastCard_iOS(WeatherForecast snapshot, int index) {
  var forecastList = snapshot.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];

  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var tempMax = forecastList[index].temp.max.toStringAsFixed(0);

  var icon = forecastList[index].getIconURL();

  return Container(
    decoration: BoxDecoration(border: Border.all()),
    child: Column(
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
    ),
  );
}
